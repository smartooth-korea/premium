package co.smartooth.premium.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.smartooth.premium.service.AuthService;
import co.smartooth.premium.service.LogService;
import co.smartooth.premium.service.MailAuthService;
import co.smartooth.premium.service.UserService;
import co.smartooth.premium.vo.AuthVO;
import co.smartooth.premium.vo.UserVO;
import co.smartooth.utils.JwtTokenUtil;


/**
 * 작성자 : 정주현
 * 작성일 : 2023. 11. 08
 */
@Controller
@PropertySource({ "classpath:application.yml" })
public class LoginController {
	
	
	@Autowired(required = false)
	private UserService userService;
	
	@Autowired(required = false)
	private AuthService authService;
	
	@Autowired(required = false)
	private MailAuthService mailAuthService;
	
	@Autowired(required = false)
	private LogService logService;
	
	@Value("${loginUrl}")
    private String loginUrl;

	
	
	
	/**
	 * 기능   : 앱 로그인 API (공통 API)
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 10
	 */
	@PostMapping(value = {"/login.do"})
	@ResponseBody
	public HashMap<String,Object> appLogin(HttpServletRequest request, @RequestBody HashMap<String, Object> paramMap) {
		
	    // 서버포트
	    int serverPort = request.getServerPort();
	    
	    // ID와 PWD 유효성 체크
	    int loginChkByIdPwd = 0;
	    // ID 존재 여부
	    int isIdExist = 0;
	    
	    // 아이디
	    String userId = (String)paramMap.get("userId");
	    // 비밀번호
		String userPwd = (String)paramMap.get("userPwd");
		// 로그인 IP
		String loginIp = request.getRemoteAddr();
		// 인증 토큰
		String userAuthToken = null;
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		// 로그인 인증 VO
		AuthVO authVO = new AuthVO();
		// 법정대리인 계정 정보 VO
		UserVO parentUserVO = new UserVO();
		// 자녀 계정 정보 VO
		List<UserVO> studentUserInfoList = new ArrayList<UserVO>();
		
		// 오늘 일자 계산
		Date tmpDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sysDate = sdf.format(tmpDate);
		
		// 인증 VO
		authVO.setUserId(userId);
		authVO.setUserPwd(userPwd);
		authVO.setLoginDt(sysDate);
		authVO.setLoginIp(loginIp);
		authVO.setUserType("SCH-APP");
		
		try {
			// 아이디와 비밀번호로 유효성 검사
			loginChkByIdPwd = authService.loginChkByIdPwd(userId, userPwd);
			
			if(loginChkByIdPwd == 0){ // 0일 경우는 Database에 ID와 비밀번호가 틀린 것
				isIdExist = authService.isIdExist(userId);
				if(isIdExist == 0) { // ID가 존재하지 않을 경우
					hm.put("code", "405");
					hm.put("msg", "해당 아이디는 존재하지 않습니다.");
				}else { // PWD가 틀렸을 경우
					hm.put("code", "406");
					hm.put("msg", "비밀번호가 틀렸습니다.");
				}
			}else { 
				// ID와 PWD가 검증된 이후 JWT 토큰과 계정 정보를 제공하고 LOG를 INSERT
				// JWT token 발행
				JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();
				userAuthToken = jwtTokenUtil.createToken(userId);
				
				// 로그인 일자 업데이트
				logService.updateLoginDt(authVO);

				/** 유치원, 어린이집 조회 앱 **/
				if(serverPort == 8094) {
					// 법정대리인 계정 정보
					parentUserVO = userService.selectUserInfo(userId);
					// 자녀 계정 정보
					studentUserInfoList = userService.selectStudentUserInfoByParentUserId(userId);
					// 데이터 RETURN
					hm.put("userAuthToken", userAuthToken);
					hm.put("parentUserInfo", parentUserVO);
					hm.put("studentUserInfoList", studentUserInfoList);
				}
				
				// 메시지 RETURN
				hm.put("code", "000");
				hm.put("msg", "로그인 성공");
				// 로그인 기록 Log 등록
				logService.insertUserLoginHistory(authVO);
				// 로그인 횟수 증가
				logService.updateLoginCount(userId);
			}
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "로그인 중 에러가 발생했습니다.\n관리자에게 문의해주시기 바랍니다.");
			e.printStackTrace();
		}
		return hm;
	}
	
	
	
	/**
	 * 기능   : 법정대리인 및 피측정자용 - 진단 결과지 로그인
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 30
	 * 수정일 : 2023. 11. 30
	 */
	@PostMapping(value = {"/web/statistics/general/login.do"})
	public String generalLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
       
		
		// 로그인 후 조회시 필요한 것들
		int loginChkByIdPwd = 0;
		// 회원아이디와 기관코드 대조
		int loginchkByIdOrganCd = 0;
		int isIdExist = 0;
		String isEmailAuthEnabled = "N";
		
		HttpSession session = request.getSession(true);
		// 세션 유지 시간 30분
		session.setMaxInactiveInterval(60*30*1);
		
		String userId = request.getParameter("userId");
		String studentUserId = null;
		String userPwd = request.getParameter("userPwd");
		String userType = null;
		// 로그인 시 링크에 포함되어있는 schoolCode를 받아서 변수에 저장
		String organCd = request.getParameter("schoolCode");
		
		AuthVO authVO = new AuthVO();
		UserVO userVO = new UserVO();
		UserVO userInfo = new UserVO(); 
		
		// 비밀번호 암호화 
		//AES256Util aes256Util = new AES256Util();
		//userPwd = aes256Util.aesEncode(userPwd);
		
		// 오늘 일자 계산
		Date tmpDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
		String sysDate = sdf.format(tmpDate);
		
		
		try {
			// 아이디 검증 ::: schoolCode를 검증해야함
			loginChkByIdPwd = authService.loginChkByIdPwd(userId, userPwd);
			if(loginChkByIdPwd == 0){
				// 0일 경우는 Database에 ID와 비밀번호가 틀린 것
				isIdExist = authService.isIdExist(userId);
				if(isIdExist == 0) {
					 // ID가 존재하지 않을 경우
					model.addAttribute("msg", "등록 되어있지 않은 아이디입니다.");
				}else { 
					// Password가 틀렸을 경우
					model.addAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해주시기 바랍니다.");
				}
				model.addAttribute("loginUrl", loginUrl+"/login");
				return "/common/alertMessage";
				
			}else {
				
				// 회원 정보 및 상세정보 조회
				UserVO tmpUserVO = userService.selectUserInfo(userId);
				userType = tmpUserVO.getUserType();
				
				// 로그인 VO
				authVO.setUserId(userId);
				authVO.setUserPwd(userPwd);
				authVO.setLoginDt(sysDate);
				authVO.setUserType("SCH-WEB");
				// 회원 VO
				userVO.setUserId(userId);
				userVO.setUserType(userType);
				
				
				if(userType.equals("PR")) {
					// 법정대리인 아이디로 피측정자 아이디 조회
					// stUserId = userService.selectChUserId(userId);
					List<UserVO> studentInfo = userService.selectStudentUserInfoByParentUserId(userId);
					studentUserId = studentInfo.get(0).getChildId();
					// 피측정자 정보 및 상세정보 조회
					userVO = userService.selectUserInfo(studentUserId);
				}else {
					// 법정대리인이 아닐 경우 학생의 아이디를 USER_ID로 사용
					studentUserId = userId;
				}
				
				// 비밀번호가 맞을 경우 회원 아이디와 기관 코드 대조
				loginchkByIdOrganCd = authService.loginChkByIdOrganCd(studentUserId, organCd);
				if(loginchkByIdOrganCd == 0) { // 회원 아이디와 기관 코드가 맞지 않을 경우 
					model.addAttribute("msg", "해당 기관과 아이디가 일치 하지 않습니다.*기관 혹은 아이디가 정확하게 입력 되었는지 확인해주시기 바랍니다.");
					model.addAttribute("loginUrl", loginUrl+"/login");
					return "/common/alertMessage";
				}else {
					// 본인 인증 여부 확인
					isEmailAuthEnabled = mailAuthService.isEmailAuthEnabled(userId);
					if("N".contains(isEmailAuthEnabled)) { 
						session.setAttribute("userId", userId);
						session.setAttribute("organCd", organCd);
						// 이메일 인증 화면
						return "/web/auth/emailAuth";
					 }
					// 로그인 관련 정보 확인 및 로그 기록 등록
					logService.updateLoginDt(authVO);
					
					//userInfo = userService.selectUserInfo(userId);
					userInfo = userService.selectUserInfo(studentUserId);
					userType = userInfo.getUserType();
					
					// 로그인 기록 VO
					userVO.setUserId(userInfo.getUserId());
					userVO.setUserName(userInfo.getUserName());
					userVO.setUserType(userInfo.getUserType());
					userVO.setLoginDt(userInfo.getLoginDt());
					userVO.setSchoolCode(organCd);
					authVO.setUserNo(userInfo.getUserNo());
					authVO.setLoginDt(userInfo.getLoginDt());
					authVO.setLoginIp(request.getRemoteAddr());
					
					// 로그인 기록 등록
					logService.insertUserLoginHistory(authVO);
				}
			}
		} catch (Exception e) {
			// 로그인 실패
			authVO.setLoginResult("FAILURE");
			logService.insertUserLoginHistory(authVO);
			e.printStackTrace();
			return "error/500/login";
		}
		// 기관 코드 입력
		userInfo.setSchoolCode(organCd);
		// 세션 생성 및 HTTP응답을 받고 세션을 쿠키에 담고, response에 쿠기를 담음
		session.setAttribute("userInfo", userInfo);

		return "redirect:/web/statistics/general/diagnosis.do";
	}
	
	
	
	/**
	 * 기능   : 기관장용 - 진단 결과지 로그인 
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 12. 08
	 * 수정일 : 2023. 12. 11
	 */
	@PostMapping(value = {"/web/statistics/director/login.do"})
	public String webStatisticsDirectorLoginForm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
     
		
		// 로그인 후 조회시 필요한 것들
		int loginChkByIdPwd = 0;
		// 회원아이디와 기관코드 대조
		int loginchkByIdOrganCd = 0;
		int isIdExist = 0;
		String isEmailAuthEnabled = "N";
		
		HttpSession session = request.getSession(true);
		// 세션 유지 시간 30분
		session.setMaxInactiveInterval(60*30*1);
		
		String stUserId = null;
		String userPwd = request.getParameter("userPwd");
		String userType = null;
		// 로그인 시 링크에 포함되어있는 schoolCode를 받아서 저장
		String organCd = request.getParameter("schoolCode");
		String userId = organCd;
		
		AuthVO authVO = new AuthVO();
		UserVO userVO = new UserVO();
		UserVO userInfo = new UserVO(); 
		
		// 오늘 일자 계산
		Date tmpDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
		String sysDate = sdf.format(tmpDate);
		
		// 회원 정보 및 상세정보 조회
		UserVO tmpUserVO = userService.selectUserInfo(userId);
		userType = tmpUserVO.getUserType();
		
		// 로그인 VO
		authVO.setUserId(userId);
		authVO.setUserPwd(userPwd);
		authVO.setLoginDt(sysDate);
		authVO.setUserType(userType);
		// 회원 VO
		userVO.setUserId(userId);
		userVO.setUserType(userType);
		
		try {
			// 아이디 검증 ::: schoolCode를 검증해야함
			loginChkByIdPwd = authService.loginChkByIdPwd(userId, userPwd);
			if(loginChkByIdPwd == 0){
				// 0일 경우는 Database에 ID와 비밀번호가 틀린 것
				isIdExist = authService.isIdExist(userId);
				if(isIdExist == 0) {
					 // ID가 존재하지 않을 경우
					model.addAttribute("msg", "등록 되어있지 않은 기관입니다.");
				}else { 
					// Password가 틀렸을 경우
					model.addAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해주시기 바랍니다.");
				}
				model.addAttribute("loginUrl", loginUrl+"/director/login");
				return "/common/alertMessage";
				
			}else {
				
				// 본인(기관장) 인증 여부 확인
				isEmailAuthEnabled = mailAuthService.isEmailAuthEnabled(userId);
				
				if("N".contains(isEmailAuthEnabled)) { 
					session.setAttribute("userId", userId);
					session.setAttribute("organCd", organCd);
					// 이메일 인증 화면
					return "/web/auth/emailAuth";
				 }
				// 로그인 관련 정보 확인 및 로그 기록
				// 로그인 일자 업데이트
				logService.updateLoginDt(authVO);
				// 회원의 정보를 가져옴
				userInfo = userService.selectUserInfo(userId);
				userType = userInfo.getUserType();
				
				// 로그인 기록 VO
				userVO.setUserId(userInfo.getUserId());
				userVO.setUserName(userInfo.getUserName());
				userVO.setUserType(userInfo.getUserType());
				userVO.setLoginDt(userInfo.getLoginDt());
				userVO.setSchoolCode(organCd);
				authVO.setUserNo(userInfo.getUserNo());
				authVO.setLoginDt(userInfo.getLoginDt());
				authVO.setLoginIp(request.getRemoteAddr());
				
				// 회원 로그인 기록 등록
				logService.insertUserLoginHistory(authVO);
			}

		} catch (Exception e) {
			// 로그인 실패
			authVO.setLoginResult("FAILURE");
			logService.insertUserLoginHistory(authVO);
			e.printStackTrace();
			return "error/500";
		}

		// 기관 코드 입력
		userInfo.setSchoolCode(organCd);
		// 세션 생성 및 HTTP응답을 받고 세션을 쿠키에 담고, response에 쿠기를 담음
		session.setAttribute("userInfo", userInfo);
		
		return "redirect:/web/statistics/integrateStatistics.do";
		
	}
	
	
	
	/**
	 * 작성자 : 정주현
	 * 작성일 : 2022. 07. 18
	 * 기능   : 로그아웃
	 */
	@GetMapping(value = {"/web/statistics/general/logout.do"})
	public String logout(HttpServletRequest request, HttpSession session) {
		// 세션 종료
		session.invalidate();
		
		return "/web/login/schoolLoginForm";
	}
	
	
	
	/**
	 * 작성자 : 정주현
	 * 작성일 : 2022. 07. 18
	 * 기능   : 로그아웃
	 */
	@GetMapping(value = {"/web/statistics/director/logout.do"})
	public String directorLogout(HttpServletRequest request, HttpSession session) {
		// 세션 종료
		session.invalidate();
		
		return "/web/statistics/login/directorLoginForm";
	}
	
	
	
}
