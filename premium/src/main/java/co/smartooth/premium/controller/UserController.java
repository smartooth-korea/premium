package co.smartooth.premium.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import co.smartooth.premium.service.LocationService;
import co.smartooth.premium.service.MailAuthService;
import co.smartooth.premium.service.OrganService;
import co.smartooth.premium.service.TeethService;
import co.smartooth.premium.service.UserService;
import co.smartooth.premium.vo.LocationVO;
import co.smartooth.premium.vo.OrganVO;
import co.smartooth.premium.vo.TeethInfoVO;
import co.smartooth.premium.vo.UserVO;
import co.smartooth.utils.JwtTokenUtil;


/**
 * 작성자 : 정주현
 * 작성일 : 2023. 11. 08
 * 수정일 : 
 */
@Controller
public class UserController {

	@Value("${loginUrl}")
	private String loginUrl;

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired(required = false)
	private UserService userService;

	@Autowired(required = false)
	private OrganService organService;

	@Autowired(required = false)
	private LocationService locationService;

	@Autowired(required = false)
	private TeethService teethService;

	@Autowired(required = false)
	private MailAuthService mailAuthService;
	
	
	// 사용자 인증 여부
	private static boolean tokenValidation = false;
	
	

	
	/**
	 * 기능   : 아이디(이메일) 중복 확인
	 * 비고   : 중복 확인 API의 경우 모두 동일한 코드가 사용됨
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 08
	 */
	@PostMapping(value = {"/user/duplicateChkId.do"})
	@ResponseBody
	public HashMap<String,Object> duplicateChkId(@RequestBody HashMap<String, String> paramMap){

		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		int isExistId = 0;

		String userId = (String)paramMap.get("userId");
		// Parameter = userEmail 값 검증 (Null 체크 및 공백 체크)
		if(userId == null || userId.equals("")) {
			hm.put("code", "401");
			hm.put("msg", "아이디가 전달되지 않았습니다.");
			return hm;
		}

		try {
			// 아이디 중복 여부 체크
			isExistId =  userService.duplicateChkId(userId);
			
			if(isExistId > 0) {
				hm.put("code", "402");
				hm.put("msg", "해당 아이디는 이미 등록되어 있습니다.");
			}else {
				hm.put("code", "000");
				hm.put("msg", "등록이 가능한 아이디입니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			hm.put("code", "500");
			hm.put("msg", "아이디 중복 확인 중 에러가 발생하였습니다.\n관리자에게 문의해주시기 바랍니다.");
		}
		
		return hm;
	}
	
	
	
	/**
	 * 기능   : 앱 내 계정 등록 API - 기본 계정 등록 API
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 13
	 * 비고 : 주소는 입력받지 않음
	 */
	@PostMapping(value = {"/user/insertUserInfo.do"})
	@ResponseBody
	@Transactional
	public HashMap<String,Object> insertUserInfo(HttpServletRequest request, @RequestBody HashMap<String, Object> paramMap) throws Exception{
		
		// API 요청 port
		int serverPort = request.getServerPort();
		
		// 접속자의 지역 정보
		Locale locale = request.getLocale();
		//아이디(이메일)
		String userId = (String)paramMap.get("userId");
		// 회원 비밀번호
		String userPwd = (String)paramMap.get("userPwd");
		// 회원 이름
		String userName = (String)paramMap.get("userName");
		// 회원 타입
		String userType = "PA";
		// 회원 이메일
		String userEmail = userId;
		// 회원 생일
		String userBirthday = (String)paramMap.get("userBirthday");
		// 회원 전화번호
		String userTelNo = (String)paramMap.get("userTelNo");
		// 회원 성별
		String userSex = (String)paramMap.get("userSex");
		// 푸쉬토큰
		String pushToken = (String)paramMap.get("pushToken");
		// 동의 여부 :: 계정을 등록했다는 것은 동의를 했다는 것으로 간주
		String agreYn = "Y";
		// 국가 코드 (대문자)
		String countryCd = locale.getCountry();
		
		LocationVO locationVO = locationService.selectNationalInfo(countryCd);
		
		String countryNm = locationVO.getNationalNameKor();
		
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		// 회원 정보 VO
		UserVO userVO = new UserVO();

		try {
			
			if(serverPort == 8094) {
				// 계정 정보 등록 : 현재 주소는 입력 X
				userVO.setUserId(userId);
				userVO.setUserPwd(userPwd);
				userVO.setUserName(userName);
				userVO.setUserType(userType);
				userVO.setUserEmail(userEmail);
				userVO.setUserBirthday(userBirthday);
				userVO.setUserTelNo(userTelNo);
				userVO.setUserSex(userSex);
				userVO.setPushToken(pushToken);
				userVO.setAgreYn(agreYn);
				userVO.setCountryNm(countryNm);
			}
			
			// 법정대리인 계정 등록
			userService.insertUserInfo(userVO);
			
			hm.put("code", "000");
			hm.put("msg", "회원 등록이 완료되었습니다.");
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "계정 등록에 실패하였습니다.\n관리자에게 문의해주시기 바랍니다.");
			e.printStackTrace();
		}
		
		return hm;
	}
	
	

	/**
	 * 기능   : 앱 내 계정 비밀번호 수정
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 10
	 */
	@PostMapping(value = {"/user/updateUserPwd.do"})
	@ResponseBody
	public HashMap<String,Object> updateUserPwd(HttpServletRequest request, @RequestBody HashMap<String, String> paramMap) {
		
		String userAuthToken = request.getHeader("Authorization");
		// TOKEN 검증
		JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();
		tokenValidation = jwtTokenUtil.validateToken(userAuthToken);
		
		String userId = (String)paramMap.get("userId");
		String userPwd = (String)paramMap.get("userPwd");
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		UserVO userVO = new UserVO();
		
		// Parameter :: userId 값 검증
		if(userId == null || userId.equals("")) {
			hm.put("code", "401");
			hm.put("msg", "아이디가 전달되지 않았습니다.");
			return hm;
		}
		
		if(userPwd == null || userPwd.equals("")) {
			hm.put("code", "401");
			hm.put("msg", "비밀번호가 전달되지 않았습니다.");
			return hm;
		}
		
		userVO.setUserId(userId);
		userVO.setUserPwd(userPwd);
		
		if(true) {
			try {
				userService.updateUserPwd(userVO);
				// 메일 인증 초기화
				mailAuthService.updateAuthStatusN(userId);
				hm.put("code", "000");
				hm.put("msg", "비밀번호가 변경되었습니다.");
				
			} catch (Exception e) {
				hm.put("code", "500");
				hm.put("msg", "비밀번호 변경 중 에러가 발생하였습니다.\n관리자에게 문의해주시기 바랍니다.");
				e.printStackTrace();
			}
		}else {
			hm.put("code", "400");
			hm.put("msg", "토큰이 유효하지 않습니다.\n다시 로그인 해주시기 바랍니다.");
		}
		return hm;
	}	
	
	
	
	/**
	 * 기능   : 비밀번호 재설정(찾기) - 인증 메일 발송
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 10
	 */
	@PostMapping(value = {"/user/findUserPwd.do"})
	@ResponseBody
	public HashMap<String,Object> findUserPwd(@RequestBody HashMap<String, String> paramMap) {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();

		// 아이디(이메일) 존재 여부
		int isExistId = 0;
		// 아이디
		String userId = (String)paramMap.get("userId");
		
		// (Null 체크 및 공백 체크)
		if(userId == null || userId.equals("")) {
			hm.put("code", "401");
			hm.put("msg", "아이디가 전달되지 않았습니다.");
			return hm;
		}
		
		try {
			// 아이디 중복 체크 :: ID가 없을 경우 0, ID가 있을 경우 1
			isExistId = userService.duplicateChkId(userId);
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "아이디 중복 확인 중 에러가 발생하였습니다.\n관리자에게 문의해주시기 바랍니다.");
			e.printStackTrace();
		}

		if (isExistId==1) { // 아이디가 있는 경우 메일 발송
			try {
				// 이메일 안에 비밀번호 변경 url을 전송하도록 함
				mailAuthService.sendAuthMail(userId);
			} catch (Exception e) {
				hm.put("code", "500");
				hm.put("msg", "인증 메일 전송 중 에러가 발생하였습니다.\n다시 시도해주시기 바랍니다.");
				e.printStackTrace();
				return hm;
			}
			hm.put("code", "000");
			hm.put("msg", "인증 메일이 발송되었습니다.");
		} else { 
			// 아이디가 없을 경우 JSON code 및 msg RETURN
			hm.put("code", "405");
			hm.put("msg", "해당 이메일은 등록 되어있지 않습니다.\n다시 시도해주시기 바랍니다.");
		}
		return hm;
	}	

	
	
	/**
	 * 기능   : 계정 정보 수정(업데이트) - 개인정보
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 13
	 */
	@PostMapping(value = {"/user/updateUserInfo.do"})
	@ResponseBody
	public HashMap<String,Object> updateUserInfo(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		UserVO userVO = new UserVO();
		
		// 인증 토큰
		String userAuthToken = request.getHeader("Authorization");
		// 아이디 (이메일)
		String userId = (String)paramMap.get("userId");
		// 이름
		String userName = (String)paramMap.get("userName");
		// 생년월일
		String userBirthday = (String)paramMap.get("userBirthday");
		// 전화번호
		String userTelNo = (String)paramMap.get("userTelNo");
		// 성별
		String userSex = (String)paramMap.get("userSex");
		
		// Parameter = userId 값 검증 (Null 체크 및 공백 체크)
		userId= (String)paramMap.get("userId");
		if(userId == null || userId.equals("") || userId.equals(" ")) {
			hm.put("code", "401");
			hm.put("msg", "아이디가 전달되지 않았습니다.");
			return hm;
		}
		
		// TOKEN 검증
		JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();
		tokenValidation = jwtTokenUtil.validateToken(userAuthToken);
		
		if (true) {
			try {
				
				// 변경할 계정 정보
				userVO.setUserId(userId);
				userVO.setUserName(userName);
				userVO.setUserBirthday(userBirthday);
				userVO.setUserTelNo(userTelNo);
				userVO.setUserSex(userSex);
				// 계정 정보 수정
				userService.updateUserInfo(userVO);
				
				hm.put("code", "000");
				hm.put("msg", "계정 정보 수정 완료");
				
			} catch (Exception e) {
				hm.put("code", "500");
				hm.put("msg", "계정 정보 수정 중 에러가 발생하였습니다.\n관리자에게 문의해주시기 바랍니다.");
				e.printStackTrace();
			}
		}else {
			hm.put("code", "400");
			hm.put("msg", "토큰이 유효하지 않습니다.\n다시 로그인 해주시기 바랍니다.");
		}
		
		return hm;
	}
	
	
	
	/**
	 * 기능   : 피측정자(자녀) 계정 정보 삭제 (개인정보 및 연결 된 정보 삭제)
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 13
	 */
	@Transactional
	@PostMapping(value = {"/user/deleteStudentUserInfo.do"})
	@ResponseBody
	public HashMap<String,Object> deleteUserInfo(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		// 인증 토큰
		String userAuthToken = request.getHeader("Authorization");
		// 법정대리인 아이디
		String parentUserId = (String)paramMap.get("parentUserId");
		// 피측정자 아이디
		String studentUserId = (String)paramMap.get("studentUserId");
		
		// Parameter = userId 값 검증 (Null 체크 및 공백 체크)
		if(parentUserId == null || parentUserId.equals("") || parentUserId.equals(" ")) {
			hm.put("code", "401");
			hm.put("msg", "법정대리인 계정의 아이디가 전달되지 않았습니다.");
			return hm;
		}
		if(studentUserId == null || studentUserId.equals("") || studentUserId.equals(" ")) {
			hm.put("code", "401");
			hm.put("msg", "자녀(피측정자) 계정의 아이디가 전달되지 않았습니다.");
			return hm;
		}
		
		// TOKEN 검증
		JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();
		tokenValidation = jwtTokenUtil.validateToken(userAuthToken);
		
		if (true) {
			try {
				
				// 법정대리인과 피측정자의 연결고리 삭제
				userService.deleteParentUserDetailInfo(parentUserId, studentUserId);
				// 피측정자와 유치원, 어린이집 반의 연결고리 삭제
				userService.deleteStudentUserDetailInfo(studentUserId);
				// 피측정자 계정 삭제
				userService.deleteUserInfo(studentUserId);
				
			} catch (Exception e) {
				hm.put("code", "500");
				hm.put("msg", "계정 정보 삭제 중 에러가 발생하였습니다.\n관리자에게 문의해주시기 바랍니다.");
				e.printStackTrace();
			}
		}else {
			hm.put("code", "400");
			hm.put("msg", "토큰이 유효하지 않습니다.\n다시 로그인 해주시기 바랍니다.");
		}
		hm.put("code", "000");
		hm.put("msg", "계정 정보 삭제 완료");
		return hm;
	}
	
	
	
	/**
	 * 기능   : 푸시토큰 업데이트(수정)
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 13
	 */
	@PostMapping(value = {"/user/updatePushToken.do"})
	@ResponseBody
	public HashMap<String,Object> updateUserPushToken(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		
		// 인증 토큰
		String userAuthToken = (String)paramMap.get("userAuthToken");
		
		// 아이디(이메일)
		String userId = (String)paramMap.get("userId");
		String pushToken = (String)paramMap.get("pushToken");
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		// Parameter = userId 값 검증 (Null 체크 및 공백 체크)
		if(userId == null || userId.equals("") || userId.equals(" ")) {
			hm.put("code", "401");
			hm.put("msg", "아이디가 전달되지 않았습니다.");
			return hm;
		}
		
		// TOKEN 검증
		JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();
		tokenValidation = jwtTokenUtil.validateToken(userAuthToken);
		
		if (true) {
			try {
				// 푸시토큰 업데이트(등록, 수정)
				userService.updatePushToken(userId, pushToken);
			} catch (Exception e) {
				hm.put("code", "500");
				hm.put("msg", "푸시토큰 등록 중 오류가 발생하였습니다.\n관리자에게 문의해주시기 바랍니다.");
				e.printStackTrace();
			}
		}else {
			hm.put("code", "400");
			hm.put("msg", "로그인 토큰이 유효하지 않습니다.\n다시 로그인 해주시기 바랍니다.");
		}
		
		hm.put("code", "000");
		hm.put("msg", "토큰 등록(수정) 완료");
		return hm;
	}

	
	
	
	
	
	
	
	
	
	
	
	/**
	 ********** 단독으로 사용 **********
	 * 기능 : 개인정보 동의서로 회원가입 
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 08
	 */
	@Transactional
	@PostMapping(value = { "/user/agreement/insertUserInfo.do" })
	public String insertUserInfo(@RequestBody Map<String, String> paramMap, HttpServletRequest request, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
		
		// 법정대리인 아이디 : 형식 - email
		String parentUserId = paramMap.get("parentUserId");
		// 법정대리인 이름
		String parentUserName = paramMap.get("parentUserName");
		// 법정대리인 비밀번호 - 초기 비밀번호 : 0000
		String parentUserPwd = "0000";
		// 법정대리인 전화번호 뒤 4자리
		String parentUserTelNo = paramMap.get("parentUserTelNo");
		//String paUserTelNo1 = null;
		//String paUserTelNo2 = null;
		//String paUserTelNo3 = null;
		
		// 피측정자 아이디 : 자동생성(기존방식)
		String studentUserId = null;
		// 피측정자 비밀번호 - 초기 비밀번호 : 0000
		String studentUserPwd = "0000";
		// 피측정자 이름
		String studentUserName = paramMap.get("studentUserName");
		// 법정대리인의 전화번호를 사용
		// String userTelNo = null;
		// 피측정자 생년월일
		String studentUserBirthday = paramMap.get("studentUserBirthday");
		// 피측정자 성별
		String studentUserSex = paramMap.get("studentUserSex");
//		String strBirthday = null;

		// 유치원, 어린이집 원아 명수 관련 시퀀스 번호
		int userSeqNo = 0;
		
		// 유치원, 어린이집 코드
		String schoolCode = paramMap.get("schoolCode");
		// 유치원, 어린이집 반 코드
		String classCode = paramMap.get("classCode");
		
		// 기관 주소
		String organSidoNm = null;
		String organSigunguNm = null;
		String organEupmyeondongNm = null;

		// 법정대리인, 피측정자 주소 정보
		String countryCd = null;
		String countryNm = null;
		String organType = null;
		
		// 피측정자
		UserVO studentUserVO = new UserVO();
		// 법정대리인
		UserVO parentUserVO = new UserVO();
		
		// 유치원, 어린이집 정보
		OrganVO organVO = new OrganVO();
		// 지역 정보 (나라)
		LocationVO locationVO = new LocationVO();

		// USER_TYPE은 M 으로 하드코딩
		
		// 기관 코드로 주소 조회 :: 피측정자 (학생) 주소 정보 입력 시 필요
		organVO = organService.selectSchoolInfo(schoolCode);
		
		// 유치원, 어린이집 주소 : 시도
		organSidoNm = organVO.getOrganSidoNm();
		// 유치원, 어린이집 주소 : 시군구
		organSigunguNm = organVO.getOrganSigunguNm();
		// 유치원, 어린이집 주소 : 읍면동
		organEupmyeondongNm = organVO.getOrganEupmyeondongNm();

		// 피측정자 (학생) 회원 주소 (유치원 주소 기준)
		countryCd = schoolCode.substring(0,2); 
		// 나라 코드로 국가명 조회
		locationVO = locationService.selectNationalInfo(countryCd);
		countryNm = locationVO.getNationalNameKor();
		// 기관 유형
		organType = schoolCode.substring(2,4);
		
		// 피측정자 (학생) 회원 시퀀스
		userSeqNo = organVO.getUserSeqNo();
		// 피측정자 아이디 생성
		studentUserId = countryCd+"ST"+schoolCode.substring(4, schoolCode.length())+String.format("%03d", userSeqNo);
		// 피측정자 (학생) 회원 시퀀스 증가
		userSeqNo++;

		// 피측정자 회원 정보 VO
		studentUserVO.setUserId(studentUserId);
		studentUserVO.setUserName(studentUserName);
		studentUserVO.setUserPwd(studentUserPwd);
		studentUserVO.setUserType("ST");
		studentUserVO.setUserBirthday(studentUserBirthday);
		studentUserVO.setUserCountry(countryCd);
		studentUserVO.setTeethType("M");
		// 부모의 번호 입력
		studentUserVO.setUserTelNo(parentUserTelNo);
		studentUserVO.setUserSex(studentUserSex);
		studentUserVO.setCountryNm(countryNm);
		studentUserVO.setSidoNm(organSidoNm);
		studentUserVO.setSigunguNm(organSigunguNm);
		studentUserVO.setEupmyeondongNm(organEupmyeondongNm);

		// 법정대리인 회원 정보 VO
		parentUserVO.setUserId(parentUserId);
		parentUserVO.setUserName(parentUserName);
		parentUserVO.setUserPwd(parentUserPwd);
		parentUserVO.setUserType("PR");
		parentUserVO.setUserTelNo(parentUserTelNo);
		parentUserVO.setUserCountry(countryCd);
		parentUserVO.setCountryNm(countryNm);
		parentUserVO.setSidoNm(organSidoNm);
		parentUserVO.setSigunguNm(organSigunguNm);
		parentUserVO.setEupmyeondongNm(organEupmyeondongNm);

		// 기관 정보 VO
		organVO.setUserSeqNo(userSeqNo);
		organVO.setSchoolCode(schoolCode);
		
		// 계정 등록 (피측정자 회원) - ST_USER
		userService.insertUserInfo(studentUserVO);
		
		// 계정 상세 정보 등록 (피측정자 - 학생) - ST_STUDENT_USER_DETAL
		userService.insertStudentUserDetail(studentUserId, organType, classCode);
		
		// 계정 등록 (법정대리인 회원) - ST_USER
		userService.insertUserInfo(parentUserVO);
		
		// 계정 상세 정보 등록 (법정대리인) - ST_PARENT_USER_DETAL
		userService.insertParentUserDetail(parentUserId, studentUserId);

		// 치아 상태
		teethService.insertUserTeethInfo(studentUserId);

		//  피측정자 증가에 따른 기관 회원 시퀀스 증가 
		organService.updateSchoolUserSeqNo(organVO);
			
		// 리다이렉션 시 파라미터를 전달
		redirectAttributes.addFlashAttribute("msg", "제출이 완료 되었습니다. 감사합니다.");
		
		return "redirect:/web/statistics/login/statisticsLoginForm";

	}
	
	
	
	/**
	 * 기능   : 앱 내 자녀 계정 등록
	 * 사용처 : 유치원, 어린이집 조회 앱
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 13
	 * 비고 : 유치원, 어린이집 코드와 반코드를 전달 받아서 생성
	 */
	@PostMapping(value = {"/user/insertStudentUserInfo.do"})
	@ResponseBody
	@Transactional
	public HashMap<String,Object> insertStudentUserInfo(HttpServletRequest request, @RequestBody HashMap<String, Object> paramMap) throws Exception{
		
		// API 요청 port
		int serverPort = request.getServerPort();
		// 접속자의 지역 정보
		Locale locale = request.getLocale();
		
		//법정대리인 아이디(이메일)
		String parentUserId = (String)paramMap.get("userId");
		// 유치원, 어린이집 코드 :: KRKG1120068001 >> KR+KG+11200680+01
		                           // KRST1120068001/001
		// 자녀(피측정자) 이름
		String studentUserName = (String)paramMap.get("studentUserName");
		// 자녀(피측정자) 비밀번호
		String studentUserPwd = "0000";
		// 자녀(피측정자) 생년월일
		String studentUserBirthday = (String)paramMap.get("studentUserBirthday");
		// 자녀(피측정자) 성별
		String studentUserSex = (String)paramMap.get("studentUserSex");
		
		String schoolCode = (String)paramMap.get("schoolCode");
		// 유치원, 어린이집 소속 반 코드
		String classCode = (String)paramMap.get("classCode");
		
		UserVO studentUserVO = new UserVO();
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		try {		
			// 나라 코드
			String countryCd = locale.getCountry();
			String addr2Cd = schoolCode.substring(4, schoolCode.length());
			// 기관 유형 (유치원, 어린이집, 초등학교, 중학교, 고등학교, 대학교)
			String organType = schoolCode.substring(2,4);
			// 유치원, 어린이집 정보
			OrganVO organVO = organService.selectSchoolInfo(schoolCode);		
			// 유치원, 어린이집 시퀀스 번호
			int userSeqNo = organVO.getUserSeqNo();
			// 자녀(피측정자) 아이디 생성 - 해당 
			// 여기 잘못됨
			String studentUserId = countryCd+"ST"+addr2Cd+String.format("%03d", userSeqNo);
			// 유치원, 어린이집 명수 추가
			userSeqNo++;
			
			// 피측정자 회원 정보 VO
			studentUserVO.setUserId(studentUserId);
			studentUserVO.setUserName(studentUserName);
			studentUserVO.setUserPwd(studentUserPwd);
			studentUserVO.setUserEmail(parentUserId);
			studentUserVO.setUserType("ST");
			studentUserVO.setUserBirthday(studentUserBirthday);
			studentUserVO.setUserCountry(countryCd);
			studentUserVO.setUserSex(studentUserSex);
			studentUserVO.setTeethType("M");
			
			// 기관 정보 VO
			organVO.setUserSeqNo(userSeqNo);
			organVO.setSchoolCode(schoolCode);
			
			// 계정 상세 정보 등록 (법정대리인) - ST_PARENT_USER_DETAIL
			userService.insertParentUserDetail(parentUserId, studentUserId);
	
			// 계정 등록 (피측정자 회원) - ST_USER
			userService.insertUserInfo(studentUserVO);
			
			// 계정 상세 정보 등록 (피측정자 - 학생) - ST_STUDENT_USER_DETAL
			userService.insertStudentUserDetail(studentUserId, organType, classCode);
			
			// 치아 상태
			teethService.insertUserTeethInfo(studentUserId);
			
			//  피측정자 증가에 따른 기관 회원 시퀀스 증가 
			organService.updateSchoolUserSeqNo(organVO);

			hm.put("code", "000");
			hm.put("msg", "자녀 등록이 완료되었습니다.");
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "계정 등록에 실패하였습니다.\n관리자에게 문의해주시기 바랍니다.");
			e.printStackTrace();
		}
		return hm;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	/**
//	 * 기능   : 비밀번호 재설정 메일 인증
//	 * 작성자 : 정주현 
//	 * 작성일 : 2023. 11. 08
//	 */
//	@GetMapping(value = {"/user/resetUserPwd.do"})
//	  public String userList(HttpServletRequest request, Model model) throws Exception {
//		
//		boolean validation = false;
//		String userId = null;
//		String emailAuthKey = null;
//		
//		userId = request.getParameter("userId");
//		emailAuthKey = request.getParameter("emailAuthKey");
//		
//		// 복호화
//		AES256Util aes256Util = new AES256Util();
//		userId = aes256Util.aesDecode(userId);
//		
//		// 토큰 검증
//		JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();
//		validation = jwtTokenUtil.validateToken(emailAuthKey);
//		model.addAttribute("userId", userId);
//		
//		if(validation) {
//		    return "/user/resetUserPwd";
//		}else {
//			return "/common/status/500_mailAuth";
//		}
//	  }
//	
//	
//
//	/**
//	 * 기능   : 조회 앱을 통한 회원가입 API
//	 * 작성자 : 정주현 
//	 * 작성일 : 2023. 06. 28
//	 */
//	@PostMapping(value = { "/customer/user/register.do" })
//	@ResponseBody
//	public HashMap<String,Object> register(@RequestBody HashMap<String, Object> paramMap) throws Exception{
//		
//		
//		logger.debug("========== CustomerUserCountroller ========== /customer/user/register.do ==========");
//		logger.debug("========== CustomerUserCountroller ========== /customer/user/register.do ==========");
//		logger.debug("========== CustomerUserCountroller ========== /customer/user/register.do ==========");
//		logger.debug("========== CustomerUserCountroller ========== /customer/user/register.do ==========");
//		
//		
//		//회원 아이디 - email
//		String userId = null;
//		// 회원 비밀번호
//		String userPwd = null;
//		// 회원 타입
//		String userType = null;
//		// 회원 이름
//		String userName = null;
//		// 회원 이메일
//		String userEmail = null;
//		
//		// 회원 생일
//		String userBirthday = null;
//		// 회원 거주 - 국
//		String userCountry = null;
//		// 회원 거주 - 주
//		String userState = null;
//		// 회원 전화번호
//		String userTelNo = null;
//		// 회원 성별
//		String userSex = null;
//		// 푸쉬토큰
//		String pushToken = null;
//		// 회원 치아 상태
//		String teethStatus = null;
//		
//		// 암호화 된 아이디
//		//String encodeUserId = null;
//		// 암호화 된 비밀번호
//		//String encodeUserPwd = null;
//		// 암호화 된 이름
//		//String encodeUserName = null;
//
//		// 회원 정보 VO
//		CustomerUserVO customerUserVO = new CustomerUserVO();
//		// 치아 정보 VO
//		CustomerTeethInfoVO customerTeethInfoVO = new CustomerTeethInfoVO();
//		// 고객 맵핑 정보 VO
//		//CustomerMappingInfoVO customerMappingInfoVO = new CustomerMappingInfoVO();  
//		// return 값
//		HashMap<String,Object> hm = new HashMap<String,Object>();
//		
//		
//		try {
//			
//			// 암호화 메소드
//			AES256Util aes256Util = new AES256Util();
//
//			// 아이디 암호화
//			userId = (String)paramMap.get("userId");
//			//userId = aes256Util.aesEncode(userId);
//			
//			// 회원 이메일
//			userEmail = userId;
//			
//			// 비밀번호 암호화
//			userPwd = (String)paramMap.get("userPwd");
//			userPwd = aes256Util.aesEncode(userPwd);
//			
//			// 이름 암호화
//			userName = (String)paramMap.get("userName");
//			//userName = aes256Util.aesEncode(userName);
//			
//			// 회원 종류
//			userType = (String)paramMap.get("userType");
//			if(userType == null || "".equals(userType)) {
//				userType = "PA";
//			}
//			
//			// 회원 거주 국
//			userCountry = (String)paramMap.get("userCountry");
//			if(userCountry == null || "".equals(userCountry)) {
//				userCountry = "KR";
//			}
//			
//			// 회원 거주 주
//			userState = (String)paramMap.get("userState");
//			if(userState == null || "".equals(userState)) {
//				userState = "";
//			}
//			
//			// 정확히 정해야 하는 부분 GR은 일반인데, 현재 일반앱에서도 GR을 사용중
//			// KRPA__________-jhjung@smartooth.co
//			// 밑줄은 10개
//			userId = userCountry+userType+"__________01-"+userEmail;		
//			
//			
//			// 회원 생일
//			userBirthday = (String)paramMap.get("userBirthday");
//			// 회원 전화번호
//			userTelNo = (String)paramMap.get("userTelNo");
//			// 회원 성별
//			userSex = (String)paramMap.get("userSex");
//			// 푸쉬토큰
//			pushToken = (String)paramMap.get("pushToken");
//			// 치아 상태
//			teethStatus = (String)paramMap.get("teethStatus");
//			if(teethStatus == null || "".equals(teethStatus)) {
//				teethStatus = "100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100";
//			}
//			
//			/** 회원 - 14세미만 일 경우 상세 정보 입력 **/
//			String prUserName = (String)paramMap.get("pUserName");
//			String prUserTelNo = (String)paramMap.get("prUserTelNo");
//			String prUserEmail = (String)paramMap.get("prUserTelNo");
//			
//			// 동의 여부
//			String agreYn = null;
//			
//			// 회원 가입 시 부모 이름 및 부모의 번호가 있을 경우 동의 한 것으로 처리 : Y 
//			if(prUserName!=null && !prUserName.equals("") || prUserTelNo!=null &&!prUserTelNo.equals("")) {
//				agreYn = "Y";
//			}
//			
//			// 회원 정보 등록
//			customerUserVO.setUserId(userId);
//			customerUserVO.setUserEmail(userId);
//			customerUserVO.setUserPwd(userPwd);
//			customerUserVO.setUserName(userName);
//			customerUserVO.setUserType(userType);
//			customerUserVO.setUserBirthday(userBirthday);
//			customerUserVO.setUserCountry(userCountry);
//			customerUserVO.setUserState(userState);
//			customerUserVO.setUserTelNo(userTelNo);
//			customerUserVO.setUserSex(userSex);
//			customerUserVO.setPushToken(pushToken);
//			customerUserVO.setUserEmail(userEmail);
//			
//			// 법정대리인 보호자 정보
//			customerUserVO.setPrUserName(prUserName);
//			customerUserVO.setPrUserTelNo(prUserTelNo);
//			customerUserVO.setPrUserEmail(prUserEmail);
//			
//			// 동의 여부
//			customerUserVO.setAgreYn(agreYn);
//			
//			// 치아 정보 등록
//			customerTeethInfoVO.setUserId(userId);
//			customerTeethInfoVO.setTeethStatus(teethStatus); 
//			
//			// 조회 앱 회원 등록 (회원가입)
//			customerUserService.insertUserInfo(customerUserVO);
//			// 조회 앱 회원 상세 정보 등록
//			customerUserService.insertCustomerUserDetail(customerUserVO);
//			// 조회 앱 회원 치아 상태 등록
//			customerTeethService.insertUserTeethInfo(customerTeethInfoVO);
//			
//		} catch (Exception e) {
//			
//			hm.put("code", "500");
//			hm.put("msg", "서버 에러가 발생했습니다.\n관리자에게 문의해주시기 바랍니다.");
//			e.printStackTrace();
//			
//		}
//		
//		hm.put("code", "000");
//		hm.put("msg", "회원 등록이 완료되었습니다.");
//		
//		return hm;
//	}
//
//	
//	
//	
//
//	
//	/**
//	 * 작성자 : 정주현
//	 * 작성일 : 2022. 03. 16
//	 * 기능 : 개인정보 동의서로 회원가입
//	 */
//	@PostMapping(value = { "/web/user/insertUserInfo.do" })
//	public String insertUserInfo(@RequestParam Map<String, String> paramMap, HttpServletRequest request, HttpSession session, Model model, RedirectAttributes redirectAttributes) throws Exception {
//		
//		
//		// 법정대리인
//		String paUserId = null;
//		String paUserName = null;
//		String paUserPwd = null;
//		String paUserTelNo = null;
//		String paUserTelNo1 = null;
//		String paUserTelNo2 = null;
//		String paUserTelNo3 = null;
//		
//		// 피측정자
//		String userId = null;
//		String userPwd = null;
//		String userName = null;
//		String userTelNo = null;
//		String userTelNo1 = null;
//		String userTelNo2 = null;
//		String userTelNo3 = null;
//		String userBritday = null;
//		String userSex = null;
//		String strBirthday = null;
//		int userSeqNo = 0;
//		
//		// 기관 및 부서 정보
//		String schoolCode = null;
//		String classCode = null;
//		
//		// 주소 정보
//		String countryNm = null;
//		String countryCd = null;
//		String organType = null;
//		
//		// 기관 주소
//		String organSidoNm = null;
//		String organSigunguNm = null;
//		String organEupmyeondongNm = null;
//		String addressDetail = null;
//		
//		// 치아 정보 (하드코딩) - 모든 치아 정상
//		//String userTeethStatus = "100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100";
//		
//		String userTeethStatus = "100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100|100";
//		
//		// 피측정자
//		UserVO webStUserVO = new UserVO();
//		// 법정대리인
//		UserVO webPaUserVO = new UserVO();
//		// 기관 정보
//		WebOrganVO webOrganVO = new WebOrganVO();
//		// 지역 정보 (나라)
//		WebLocationVO webLocationVO = new WebLocationVO();
//		// 치아 상태 정보
//		CustomerTeethInfoVO webTeethInfoVO = new CustomerTeethInfoVO();
//
//		// 암호화 클래스
//		AES256Util aes256Util = new AES256Util();
//		
//		
//		String userType = paramMap.get("userType");
//		String isOverourteetn = paramMap.get("userAgeCheck");
//		
//		// 만 14세 미만일 경우 : 법정 대리인, 자녀의 정보 입력
//		if(userType.equals("ST")) {
//			
//			// 피측정자 파라미터
//			userName = paramMap.get("stUserName");
//			userSex = paramMap.get("stUserSex");
//			userBritday = paramMap.get("stUserBirthday");
//			// 법정대리인 파라미터
//			paUserName = paramMap.get("paUserName");
//			paUserTelNo1 = paramMap.get("paUserTelNo1");
//			paUserTelNo2 = paramMap.get("paUserTelNo2");
//			paUserTelNo3 = paramMap.get("paUserTelNo3");
//			paUserTelNo = paUserTelNo1+"-"+paUserTelNo2+"-"+paUserTelNo3;
//			// 학교 정보
//			schoolCode = paramMap.get("schoolCode");
//			classCode = paramMap.get("classCode1");
//			
//			// 기관 코드로 주소 조회 :: 피측정자 (학생) 주소 정보 입력 시 필요
//			webOrganVO = webOrganService.selectOrganInfo(schoolCode);
//			// 주소 정보 : 시도
//			organSidoNm = webOrganVO.getOrganSidoNm();
//			// 주소 정보 : 시군구
//			organSigunguNm = webOrganVO.getOrganSigunguNm();
//			// 주소 정보 : 읍면동
//			organEupmyeondongNm = webOrganVO.getOrganEupmyeondongNm();
//			// 상세 주소
//			addressDetail = organSidoNm+" "+organSigunguNm+" "+organEupmyeondongNm;
//			
//			// 피측정자 (학생) 회원 주소 (유치원 주소 기준)
//			countryCd = schoolCode.substring(0,2); 
//			// 나라 코드로 국가명 조회
//			webLocationVO = webLocationService.selectNationalInfo(countryCd);
//			countryNm = webLocationVO.getNationalNameKor();
//			// 기관 유형
//			organType = schoolCode.substring(2,4);
//			
//			// 피측정자 (학생) 회원 시퀀스
//			userSeqNo = webOrganVO.getUserSeqNo();
//			// 피측정자 아이디 생성
//			userId = countryCd+"ST"+schoolCode.substring(4, schoolCode.length())+String.format("%03d", userSeqNo);
//			// 피측정자 (학생) 회원 시퀀스 증가
//			userSeqNo++;
//
//			// 비밀번호 생성 규칙 2019-01-01 >> 190101 
//			strBirthday = userBritday.substring(2, userBritday.length()).replaceAll("-", "");
//
//			// 피측정자 회원 비밀번호 :: 생년월일(190101) 
//			userPwd = aes256Util.aesEncode(strBirthday);
//			
//			// 피측정자 회원 정보 VO
//			webStUserVO.setUserId(userId);
//			webStUserVO.setUserName(userName);
//			webStUserVO.setUserPwd(userPwd);
//			webStUserVO.setUserType("ST");
//			webStUserVO.setUserBirthday(userBritday);
//			webStUserVO.setUserCountry(countryCd);
//			webStUserVO.setUserTelNo(paUserTelNo);
// 			webStUserVO.setUserSex(userSex);
//			webStUserVO.setCountryNm(countryNm);
//			webStUserVO.setSidoNm(organSidoNm);
//			webStUserVO.setSigunguNm(organSigunguNm);
//			webStUserVO.setEupmyeondongNm(organEupmyeondongNm);
//			webStUserVO.setAddrDetail(addressDetail);
//			
//			// 피측정자 회원 치아 상태 등록
//			webTeethInfoVO.setUserId(userId);
//			webTeethInfoVO.setTeethStatus(userTeethStatus);
//			
//			// 법정대리인 회원 아이디 :: 자녀이름+생년월일(190101 :: stTmpUserPwd)+전화번호 뒷자리4자리
//			paUserId = userName+strBirthday+paUserTelNo3;
//			
//			// 법정대리인 회원 비밀번호 :: 휴대전화 번호 뒷자리 4자리 
//			paUserPwd = aes256Util.aesEncode(paUserTelNo3);
//			
//			// 법정대리인 회원 정보 VO
//			webPaUserVO.setUserId(paUserId);
//			webPaUserVO.setUserName(paUserName);
//			webPaUserVO.setUserPwd(paUserPwd);
//			webPaUserVO.setUserType("PR");
//			webPaUserVO.setUserTelNo(paUserTelNo);
//			webPaUserVO.setUserCountry(countryCd);
//			webPaUserVO.setCountryNm(countryNm);
//			webPaUserVO.setSidoNm(organSidoNm);
//			webPaUserVO.setSigunguNm(organSigunguNm);
//			webPaUserVO.setEupmyeondongNm(organEupmyeondongNm);
//			webPaUserVO.setAddrDetail(addressDetail);
//			
//			// 기관 정보 VO
//			webOrganVO.setUserSeqNo(userSeqNo);
//			webOrganVO.setSchoolCode(schoolCode);
//			
//			
//			// 계정 등록 (피측정자 회원) - ST_USER
//			webUserService.insertUserInfo(webStUserVO);
//			// 계정 상세 정보 등록 (피측정자 - 학생) - ST_STUDENT_USER_DETAL
//			webUserService.insertStUserDetail(userId, organType, classCode);
//			// 계정 등록 (법정대리인 회원) - ST_USER
//			webUserService.insertUserInfo(webPaUserVO);
//			// 계정 상세 정보 등록 (법정대리인) - ST_PARENT_USER_DETAL
//			webUserService.insertPaUserDetail(paUserId, userId);
//			// 치아 상태
//			webTeethService.insertUserTeethInfo(webTeethInfoVO);
//			// 피측정자 회원 시퀀스 증가
//			webOrganService.updateOrganUserSeqNo(webOrganVO);
//			
//		}else {
//			
//			// 만 14세 이상일 경우
//			// 피측정자 파라미터
//			userName = paramMap.get("userName");
//			userSex = paramMap.get("userSex");
//			userBritday = paramMap.get("userBirthday");
//			userTelNo1 = paramMap.get("userTelNo1");
//			userTelNo2 = paramMap.get("userTelNo2");
//			userTelNo3 = paramMap.get("userTelNo3");
//			userTelNo = userTelNo1+"-"+userTelNo2+"-"+userTelNo3;
//			// 기관 정보
//			schoolCode = paramMap.get("schoolCode");
//			// 기관 부서 정보
//			classCode = paramMap.get("classCode2");
//			
//			// 기관 코드로 주소 조회
//			webOrganVO = webOrganService.selectOrganInfo(schoolCode);
//			// 주소 정보 : 시도
//			organSidoNm = webOrganVO.getOrganSidoNm();
//			// 주소 정보 : 시군구
//			organSigunguNm = webOrganVO.getOrganSigunguNm();
//			// 주소 정보 : 읍면동
//			organEupmyeondongNm = webOrganVO.getOrganEupmyeondongNm();
//			// 상세 주소
//			addressDetail = organSidoNm+" "+organSigunguNm+" "+organEupmyeondongNm;
//			// 국가 코드
//			countryCd = schoolCode.substring(0,2); 
//			// 국가 코드로 국가명 조회
//			webLocationVO = webLocationService.selectNationalInfo(countryCd);
//			// 국가명
//			countryNm = webLocationVO.getNationalNameKor();
//			// 기관 유형
//			organType = schoolCode.substring(2,4);
//			
//			// 피측정자 시퀀스
//			userSeqNo = webOrganVO.getUserSeqNo();
//			// 피측정자 아이디 생성
//			userId = countryCd+"ST"+schoolCode.substring(4, schoolCode.length())+String.format("%03d", userSeqNo);
//			// 피측정자 시퀀스 증가
//			userSeqNo++;
//
//			// 비밀번호 생성 규칙 2019-01-01 >> 190101 
//			strBirthday = userBritday.substring(2, userBritday.length()).replaceAll("-", "");
//
//			// 피측정자 비밀번호 :: 생년월일(190101) 
//			userPwd = aes256Util.aesEncode(strBirthday);
//			
//			// 피측정자 정보 VO
//			webStUserVO.setUserId(userId);
//			webStUserVO.setUserName(userName);
//			webStUserVO.setUserPwd(userPwd);
//			webStUserVO.setUserType("PT");
//			webStUserVO.setUserBirthday(userBritday);
//			webStUserVO.setUserCountry(countryCd);
//			webStUserVO.setUserTelNo(userTelNo);
//			webStUserVO.setUserSex(userSex);
//			webStUserVO.setCountryNm(countryNm);
//			webStUserVO.setSidoNm(organSidoNm);
//			webStUserVO.setSigunguNm(organSigunguNm);
//			webStUserVO.setEupmyeondongNm(organEupmyeondongNm);
//			webStUserVO.setAddrDetail(addressDetail);
//			
//			// 피측정자 치아 상태 등록
//			webTeethInfoVO.setUserId(userId);
//			webTeethInfoVO.setTeethStatus(userTeethStatus);
//			
//			// 기관 정보 VO
//			webOrganVO.setUserSeqNo(userSeqNo);
//			webOrganVO.setSchoolCode(schoolCode);
//			
//			// 계정 등록 (피측정자) - ST_USER
//			webUserService.insertUserInfo(webStUserVO);
//			// 계정 상세 정보 등록 (피측정자) - ST_STUDENT_USER_DETAL
//			webUserService.insertStUserDetail(userId, organType, classCode);
//			// 치아 상태
//			webTeethService.insertUserTeethInfo(webTeethInfoVO);
//			// 피측정자 회원 시퀀스 증가
//			webOrganService.updateOrganUserSeqNo(webOrganVO);
//		}
//		
//		
//		
//		// 리다이렉션 시 파라미터를 전달
//		redirectAttributes.addFlashAttribute("msg", "제출이 완료 되었습니다. 감사합니다.");
//		
//		return "redirect:/web/user/agreement";
//
//	}
//	
//	
//	
//
}
