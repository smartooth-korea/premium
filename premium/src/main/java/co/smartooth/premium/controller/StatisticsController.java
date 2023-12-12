package co.smartooth.premium.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import co.smartooth.premium.service.DiagnosisService;
import co.smartooth.premium.service.OrganService;
import co.smartooth.premium.service.TeethService;
import co.smartooth.premium.service.UserService;
import co.smartooth.premium.vo.TeethMeasureVO;
import co.smartooth.premium.vo.UserVO;
import co.smartooth.utils.JwtTokenUtil;


/**
 * 작성자 : 정주현
 * 작성일 : 2023. 11. 14
 */
@Controller
public class StatisticsController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Value("${loginUrl}")
	private String loginUrl;

	@Autowired(required = false)
	private UserService userService;

	@Autowired(required = false)
	private TeethService teethService;

	@Autowired(required = false)
	private DiagnosisService diagnosisService;

	@Autowired(required = false)
	private OrganService organService;
	
	
	
	// 사용자 인증 토큰 검증
	private static boolean tokenValidation = false;
	
	
	
	/**
	 * APP (유치원, 어린이집 조회)
	 * 기능 : 앱 내 결과지 조회
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 14
	 */
	@PostMapping(value = { "/statistics/diagnosis.do"})
	@ResponseBody
	public HashMap<String, Object> diagnosis(HttpServletRequest request, HttpSession session, Model model, @RequestBody Map<String, String> paramMap) throws Exception {

		String userAuthToken = request.getHeader("Authorization");
		// TOKEN 검증
		JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();
		tokenValidation = jwtTokenUtil.validateToken(userAuthToken);
		
		// 리턴 맵
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		// 자녀(피측정자) 아이디
		String studentUserId = paramMap.get("studentUserId"); 
		// 측정일
		String measureDt = paramMap.get("measureDt"); 
		// 자녀(피측정자) 정보 및 상세정보 조회
		UserVO userVO = new UserVO();
		userVO = userService.selectUserInfo(studentUserId);
		
		// 유치 개수 20개
		int[] babyTeethValueArray = null;
		// 영구치 개수 8개
		int[] permTeethValueArray = null;
		// 영구치 어금니 개수 4개
		int[] permanentMolarsValueArray = null;
		// 임시 유치 배열 20개
		int[] tmpBabyTeethValueArray = null;
		
		// 충치단계 값(주의)
		Integer cautionLevel = 0;
		// 충치단계 값(위험)
		Integer dangerLevel = 0;
		// 정상 유치 개수
		int babyCvNormalCnt = 0;
		// 주의 유치 개수
		int babyCvCautionCnt = 0;
		// 충치 유치 개수
		int babyCvDangerCnt = 0;
		// 정상 영구치 개수
		int pmCvNomalCnt = 0;
		// 주의 영구치 개수
		int pmCvCautionCnt = 0;
		// 충치 영구치 개수
		int pmCvDangerCnt = 0;
	
		// 유치+영구치 개수
		int sheetNormalCnt = 0;
		int sheetCautionCnt = 0;
		int sheetdangerCnt = 0;
		
		// 진단 코드
		String userDiagCd = null;
		// 진단 코드 분리한 배열
		String[] diagCdArray;
		// 진단 코드 문자열
		String diagCdStr = null;
		// 진단 코드 별 제목 배열
		String[] diagCdTitleArray;
		// 진단 코드 설명
		String diagDescript = "";
		// 진단 코드 설명 업데이트 여부
		String diagDescriptFl = "";
		// 진단 코드 카운트
		int isDiagCnt = 0;
		
		TeethMeasureVO dataList = new TeethMeasureVO();
		List<String> measureDtList = new ArrayList<String>();
		
		try {
			if(true) {
				// 유치 개수 20개
				babyTeethValueArray = new int[20];
				// 영구치 개수 12개
				permTeethValueArray = new int[8];
				// 영구치 어금니 4개
				permanentMolarsValueArray = new int[4];
				// 영구치 위치에 해당하는 임시 유치 배열
				tmpBabyTeethValueArray = new int[8];
	
				// 측정일 목록 조회
				measureDtList = teethService.selectUserMeasureDtList(studentUserId);
				
				if(measureDtList.size() > 0) {
					if(measureDt == null || "".equals(measureDt)) {
						// 최근 측정일
						measureDt = measureDtList.get(0);
					}
				}else {
					// 측정일, 측정인원이 없을 경우
					hm.put("code", "403");
					hm.put("msg", "측정 기록이 없습니다.");
					return hm;
				}
				
				// 자녀(피측정자) 최근 치아 측정 값 조회
				dataList = teethService.selectUserMeasureValue(studentUserId, measureDt);
				// 진단 설명 수정 여부
				diagDescriptFl = dataList.getDiagDescriptFl();
		
				babyTeethValueArray[0] = dataList.getT34();
				babyTeethValueArray[1] = dataList.getT35();
				babyTeethValueArray[2] = dataList.getT36();
				// 영구치 T07
				babyTeethValueArray[3] = dataList.getT37();
				// 영구치 T08
				babyTeethValueArray[4] = dataList.getT38();
				// 영구치 T09
				babyTeethValueArray[5] = dataList.getT39();
				// 영구치 T10
				babyTeethValueArray[6] = dataList.getT40();
				babyTeethValueArray[7] = dataList.getT41();
				babyTeethValueArray[8] = dataList.getT42();
				babyTeethValueArray[9] = dataList.getT43();
				babyTeethValueArray[10] = dataList.getT46();
				babyTeethValueArray[11] = dataList.getT47();
				babyTeethValueArray[12] = dataList.getT48();
				// 영구치 T23
				babyTeethValueArray[13] = dataList.getT49();
				// 영구치 T24
				babyTeethValueArray[14] = dataList.getT50();
				// 영구치 T25
				babyTeethValueArray[15] = dataList.getT51();
				// 영구치 T26
				babyTeethValueArray[16] = dataList.getT52();
				babyTeethValueArray[17] = dataList.getT53();
				babyTeethValueArray[18] = dataList.getT54();
				babyTeethValueArray[19] = dataList.getT55();
		
				// 영구치 어금니 - 16, 26, 36, 46
				permanentMolarsValueArray[0] = dataList.getT33();
				permanentMolarsValueArray[1] = dataList.getT44();
				permanentMolarsValueArray[2] = dataList.getT45();
				permanentMolarsValueArray[3] = dataList.getT56();
				
				// 영구치 상악
				permTeethValueArray[0] = dataList.getT07(); 
				permTeethValueArray[1] = dataList.getT08(); 
				permTeethValueArray[2] = dataList.getT09(); 
				permTeethValueArray[3] = dataList.getT10(); 
	
				// 영구치 하악
				permTeethValueArray[4] = dataList.getT23(); 
				permTeethValueArray[5] = dataList.getT24(); 
				permTeethValueArray[6] = dataList.getT25(); 
				permTeethValueArray[7] = dataList.getT26(); 
				
				// 갯수 카운팅을 위한 임시 배열
				tmpBabyTeethValueArray[0] = dataList.getT37();
				tmpBabyTeethValueArray[1] = dataList.getT38();
				tmpBabyTeethValueArray[2] = dataList.getT39();
				tmpBabyTeethValueArray[3] = dataList.getT40();
				tmpBabyTeethValueArray[4] = dataList.getT49();
				tmpBabyTeethValueArray[5] = dataList.getT50();
				tmpBabyTeethValueArray[6] = dataList.getT51();
				tmpBabyTeethValueArray[7] = dataList.getT52();
				
				// 자녀(피측정자) 진단 코드 조회
				userDiagCd = dataList.getDiagCd();
				
				// CAVITY_LEVEL 분류 부분 - 충치 단계별 수치 조회
				HashMap<String, Integer> cavityLevel = teethService.selectCavityLevel();
				
				// 충치 단계 조회 (주의, 충치)
				cautionLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_CAUTION")));
				dangerLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_DANGER")));
				
				/** 유치 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < babyTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (babyTeethValueArray[i] > 1000) {
						babyTeethValueArray[i] = (int) babyTeethValueArray[i] - 1000;
					}
					if (babyTeethValueArray[i] < cautionLevel) { // 정상 치아는 -99이상 체크
						babyCvNormalCnt++;
					} else if (babyTeethValueArray[i] >= cautionLevel && babyTeethValueArray[i] < dangerLevel) {
						babyCvCautionCnt++;
					} else if (babyTeethValueArray[i] >= dangerLevel) {
						babyCvDangerCnt++;
					}
				}
				
				/** 영구치 상악 하악 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < permTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (permTeethValueArray[i] > 1000) {
						permTeethValueArray[i] = (int) permTeethValueArray[i] - 1000;
					}
					if (permTeethValueArray[i] >= cautionLevel && permTeethValueArray[i] < dangerLevel) {
						pmCvCautionCnt++;
					} else if (permTeethValueArray[i] >= dangerLevel) {
						pmCvDangerCnt++;
					}
				}
				
				for(int i=0; i < tmpBabyTeethValueArray.length; i++) {
					if (tmpBabyTeethValueArray[i] > 1000) {
						tmpBabyTeethValueArray[i] = (int) tmpBabyTeethValueArray[i] - 1000;
					}	
				}
				
				/** 영구치와 유치 두 개 다 값이 있을 경우  **/
				for(int i=0; i<8; i++) {
					if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] > 0) {
						if(tmpBabyTeethValueArray[i] >= cautionLevel && tmpBabyTeethValueArray[i] < dangerLevel) {
							// 유치의 값이 주의 단계와 같거나 크고 주의 단계보다 작을 때 :: 범위는 주의 단계 이므로 유치의 주의 단계의 개수를 차감
							babyCvCautionCnt--;
						}else if(tmpBabyTeethValueArray[i]  > dangerLevel) {
							// 유치의 값이 위험 단계보다 클때 :: 범위는 위험 단계 이므로 유치의 위험 단계의 개수를 차감
							babyCvDangerCnt--;
						}
					}
					// 영구치 측정 값이 있고 유치 측정값이 0이거나 -99일때 정상치아 갯수를 -1해준다
					if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] <=0) {
						babyCvNormalCnt--;
					}
				}
				
				/** 영구치 어금니 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < permanentMolarsValueArray.length; i++) {
					// 측정자가 입력한 주의나 충치 값의 -1000
					if (permanentMolarsValueArray[i] > 1000) {
						permanentMolarsValueArray[i] = (int) permanentMolarsValueArray[i] - 1000;
					}
					if (permanentMolarsValueArray[i] >= cautionLevel && permanentMolarsValueArray[i] < dangerLevel) {
						pmCvCautionCnt++;
					} else if (permanentMolarsValueArray[i] >= dangerLevel) {
						pmCvDangerCnt++;
					}
				}
				
				if (diagDescriptFl.equals("N")) {
					if (userDiagCd != null && !"".equals(userDiagCd)) {
						diagCdArray = userDiagCd.split("\\|");
						List<String> list = new ArrayList<String>();
						diagDescript = "";
						for (int i = 0; i < diagCdArray.length; i++) {
							String[] diagCdStrArray = diagCdArray[i].split(":");
							if ("1".equals(diagCdStrArray[2])) {
								diagCdStr = diagCdStrArray[0] + diagCdStrArray[1];
								list.add(diagCdStr);
								if(diagCdStr.startsWith("A00") || diagCdStr.equals("B006") ||diagCdStr.equals("E003")) {
									list.add("GA1");
								}
								// 진단 코드 존재 유무
								isDiagCnt++;
							}
						}
						// GA1 중복제거
						list = list.stream().distinct().collect(Collectors.toList());
						if(list.contains("GA1")){
							// 중복 제거 후 마지막에 다시 붙여주는 작업
							list.remove("GA1");
							list.add("GA1");
						}
						
						for(int i=0; i<list.size(); i++) {
							diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript(list.get(i), "M");
						}
					
						// 진단 키워드를 누르지 않으면 카운팅이 없으므로 이상없음
						if (isDiagCnt == 0) { // 하드코딩
							String diagTitle = diagnosisService.selectDiagTitle("", "M");
							userDiagCd = userDiagCd.replaceAll("E:003:0", "E:003:1");
							diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript("E003", "M") + "<br/>";
							diagDescript = diagDescript.replaceAll("			", "");
							dataList.setDiagTitle(diagTitle);
							dataList.setDiagCd(userDiagCd);
						}
						diagDescript = diagDescript.replaceAll("			", "");
						dataList.setDiagDescript(diagDescript);
					}
				}else {
					diagDescript = dataList.getDiagDescript();
				}
				
				if(diagDescriptFl.equals("N")) {
					//진단 설명 : 진단 코드로 진단명을 검색하여 진단에 대한 설명 등록
					if (userDiagCd != null && !"".equals(userDiagCd)) {
						diagCdTitleArray = userDiagCd.split("\\|");
						for (int i = 0; i < diagCdTitleArray.length; i++) {
							String diagTitle = diagnosisService.selectDiagTitle(diagCdTitleArray[i], "M");
							if (diagTitle != null) {
								dataList.setDiagTitle(diagTitle);
								break;
							}
						}
						dataList.setDiagCd(userDiagCd);
					}
				}
		
				// 진단 화면 표시 유치 정상 개수
				sheetNormalCnt = babyCvNormalCnt + pmCvNomalCnt;
				// 진단 화면 표시 유치 주의 개수
				sheetCautionCnt = babyCvCautionCnt + pmCvCautionCnt;
				// 진단 화면 표시 유치 위험 개수
				sheetdangerCnt = babyCvDangerCnt + pmCvDangerCnt;
		
				// 자녀(피측정자) 이름 등록
				dataList.setUserName(userVO.getUserName());
				// 유치 정상, 주의, 충치 개수 입력
				dataList.setCavityNormal(babyCvNormalCnt);
				dataList.setCavityCaution(babyCvCautionCnt);
				dataList.setCavityDanger(babyCvDangerCnt);
				// 영구치 정상, 주의, 충치 개수 입력
				dataList.setPermCavityNormal(pmCvNomalCnt);
				dataList.setPermCavityCaution(pmCvCautionCnt);
				dataList.setPermCavityDanger(pmCvDangerCnt);
		
				// 진단 상세 정보 업데이트
				teethService.updateDiagDescript(studentUserId, measureDt, diagDescript);
				// ST_STUDENT_USER_DETAIL 테이블에 CavityCnt 업데이트
				teethService.updateUserCavityCntByMeasureDt(dataList);
				
				hm.put("code", "000");
				hm.put("msg", "조회 성공");
				hm.put("dataList", dataList);
				hm.put("measureDtList", measureDtList);
				hm.put("cautionLevel", cautionLevel);
				hm.put("dangerLevel", dangerLevel);
				hm.put("cavityNormal", sheetNormalCnt);
				hm.put("cavityCaution", sheetCautionCnt);
				hm.put("cavityDanger", sheetdangerCnt);

			}else {
				hm.put("code", "400");
				hm.put("msg", "토큰이 유효하지 않습니다.\n다시 로그인 해주시기 바랍니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			hm.put("code", "500");
			hm.put("msg", "측정 데이터 조회 중 에러가 발생했습니다.\n관리자에게 문의해주시기 바랍니다.");
		}
		return hm;
	}
	
	
	
	/**
	 * APP (유치원, 어린이집 조회)
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 14
	 * 기능 : 앱 내 그래프 생성
	 */
	@PostMapping(value = { "/statistics/graph.do"})
	@ResponseBody
	public HashMap<String, Object> graph(HttpServletRequest request, HttpSession session, Model model, @RequestBody Map<String, String> paramMap) throws Exception {

		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		// 자녀(피측정자) 아이디
		String studentUserId = (String)paramMap.get("studentUserId");
		// 측정일
		String measureDt = (String)paramMap.get("measureDt");
		// 유치원, 어린이집 코드
		String schoolCode = (String)paramMap.get("schoolCode");
		// 자녀(피측정자) 계정 정보
		UserVO userVO = userService.selectUserInfo(studentUserId);
		
		String studentUserName = userVO.getUserName();
		// 악화지수 최대 값
		double deteriorateMaxScore = 0;

		List<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
		List<Double> deteriorateScoreList = new ArrayList<Double>();
		List<Integer> cavityCntList = new ArrayList<Integer>();
		List<String> userNameList = new ArrayList<String>();
		List<Double> userFearScoreList = new ArrayList<Double>();
		
		try {
				// 유치원,어린이집 소속 자녀(피측정자) 측정 값 목록
				dataList = teethService.selectUserMeasureStatisticsList(schoolCode, measureDt);
	
				for (int i = 0; i < dataList.size(); i++) {
					// 두려움 지수
					double fearScore = 0;
					// 악화지수 초기화
					double deteriorateScore = 0;
					// 자녀(피측정자) 이름
					String compareUserName = (String) dataList.get(i).get("USER_NAME");
					// 자녀(피측정자) 진단 태그 항목
					String diagCd = (String) dataList.get(i).get("DIAG_CD");
					// 자녀(피측정자) 개월 수
					long monthcount = (long) dataList.get(i).get("MONTH_COUNT");
	
					// 유치 및 영구치 >>  주의(caution) 치아 및 충치(danger) 치아 개수
					int cavityDangerCnt = Integer.parseInt(dataList.get(i).get("CAVITY_DANGER").toString());
					int permCavityDangerCnt = Integer.parseInt(dataList.get(i).get("PERM_CAVITY_DANGER").toString());
	
					// 악화지수
					deteriorateScore = (double) dataList.get(i).get("DETERIORATE_SCORE");
					// 악화지수 최대값 저장
					if (deteriorateMaxScore < deteriorateScore) {
						deteriorateMaxScore = deteriorateScore;
					}
	
					// 진단지 조회한 회원과 이름리스트의 이름이 일치하지 않을 경우 = 001~999로 표기
					if (!studentUserName.equals(compareUserName)) {
						compareUserName = String.format("%03d", i + 1) + "(" + monthcount + ")";
					} else {
						compareUserName = compareUserName + "(" + monthcount + ")";
					}
					
					// 두려움에 대한 처리 (하드코딩)
					if (deteriorateScore > 0 && diagCd.contains("E:001:1")) {
						// 측정 두려움 항목이 있을 경우 *별표 표시
						compareUserName = compareUserName.replaceAll("'", "");
						compareUserName = "\'" + compareUserName + "*\'";
						fearScore = 0;
					} else if (diagCd.contains("E:001:1")) {
						// 측정 두려움 항목만 있을 경우 MAX 값을 지정
						fearScore = Math.round(deteriorateMaxScore);
					}
	
					if(fearScore % 5 != 0) {
						int calFearScore = (int)fearScore % 5;
						switch(calFearScore) {
						case 1: fearScore = fearScore+4.0;
							break;
						case 2: fearScore = fearScore+3.0;
							break;
						case 3: fearScore = fearScore+2.0;
							break;
						case 4: fearScore = fearScore+1.0;
							break;
						}
					}
					userNameList.add(compareUserName);
					userFearScoreList.add(fearScore);
					cavityCntList.add(cavityDangerCnt + permCavityDangerCnt);
					deteriorateScoreList.add(deteriorateScore);
				}
				
				// 자녀(피측정자) 이름
				hm.put("studentUserName", studentUserName);
				// 자녀(피측정자) 소속 기관 코드
				hm.put("schoolCode", schoolCode);
				// 유치원, 어린이집 내 측정 인원 수
				hm.put("schoolUserCount", dataList.size());
				// 유치원, 어린이집 내 측정 인원 이름 목록
				hm.put("schoolUserNameList", userNameList);
				// 유치원, 어린이집 내 측정 인원 악화 지수 목록
				hm.put("schoolUserDeteriorateScoreList", deteriorateScoreList);
				// 유치원, 어린이집 내 측정 인원 충치 개수 목록
				hm.put("schoolUserCavityCntList", cavityCntList);
				// 유치원, 어린이집 내 측정 두려움 인원 목록
				hm.put("schoolUserFearScoreList", userFearScoreList);
				hm.put("msg", "조회 성공");
				hm.put("code", "000");
				return hm;

		} catch (Exception e) {
			e.printStackTrace();
			hm.put("code", "500");
			hm.put("msg", "그래프 정보 생성에 실패했습니다.\n관리자에게 문의해주시기 바랍니다.");
			return hm;
		}
	}
	
	
	
	/**
	 * WEB (유치원, 어린이집 조회)
	 * 기능 : 결과 진단지 로직 - 학교,유치원,어린이집
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 30
	 * 수정일 : 2023. 11. 30
	 *         
	 */
	@GetMapping(value = { "/web/statistics/general/diagnosis.do"})
	public String diagnosis(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		
		String returnUrl = null;
		
		if (sessionVO == null) {
			return "/web/login/schoolLoginForm";
		}
		
		String userId = null;
		String userName = null;
		
		String schoolCode = sessionVO.getSchoolCode();
		
		UserVO userVO = new UserVO();
		// 자녀(피측정자) 아이디
		userId = sessionVO.getUserId();
		// 파라미터로 받은 자녀(피측정자) 정보 조회
		userVO = userService.selectUserInfo(userId);
		userName = sessionVO.getUserName();

		// 최근 측정일
		String measureDt = null;
		// 유치 개수 20개
		int[] babyTeethValueArray = null;
		// 영구치 개수 8개
		int[] permTeethValueArray = null;
		// 영구치 어금니 개수 4개
		int[] permanentMolarsValueArray = null;
		// 임시 유치 배열 20개
		int[] tmpBabyTeethValueArray = null;
		
		// 충치단계 값(주의)
		Integer cautionLevel = 0;
		// 충치단계 값(위험)
		Integer dangerLevel = 0;
	
		// 정상 유치 개수
		int babyCvNormalCnt = 0;
		// 주의 유치 개수
		int babyCvCautionCnt = 0;
		// 충치 유치 개수
		int babyCvDangerCnt = 0;
	
		// 정상 영구치 개수
		int pmCvNomalCnt = 0;
		// 주의 영구치 개수
		int pmCvCautionCnt = 0;
		// 충치 영구치 개수
		int pmCvDangerCnt = 0;
	
		// 유치+영구치 개수
		int sheetNormalCnt = 0;
		int sheetCautionCnt = 0;
		int sheetdangerCnt = 0;
		
		double cavityCautionScore = 1;
		double cavityDangerScore = 4;
		double permCavityCautionScore = 1.5;
		double permCavityDangerScore = 6;
		
		// 진단 코드
		String userDiagCd = null;
		// 진단 코드 분리한 배열
		String[] diagCdArray;
		// 진단 코드 문자열
		String diagCdStr = null;
		// 진단 코드 별 제목 배열
		String[] diagCdTitleArray;
		// 진단 코드 설명
		String diagDescript = "";
		// 진단 코드 설명 업데이트 여부
		String diagDescriptFl = "";
		// 진단 코드 카운트
		int isDiagCnt = 0;
	
		// 결제 정보에 따라서 보여지는 양을 다르게 조정 :: 기본 값은 3
		int limit = 100;
		
		TeethMeasureVO teethMeasureVO = new TeethMeasureVO();
		// AdviceVO webAdviceVO = new AdviceVO();
		List<String> measureDtList = new ArrayList<String>();
		
		try {
			// 진단 결과
			// 치아형태 - M(유치원)
			// if(teethType.equals("M")) {
			
				// 유치 개수 20개
				babyTeethValueArray = new int[20];
				// 영구치 개수 12개
				permTeethValueArray = new int[8];
				// 영구치 어금니 4개
				permanentMolarsValueArray = new int[4];
				// 영구치 위치에 해당하는 임시 유치 배열
				tmpBabyTeethValueArray = new int[8];

				// CAVITY_LEVEL 분류 부분 - 충치 단계별 수치 조회
				HashMap<String, Integer> cavityLevel = teethService.selectCavityLevel();
				
				// 치아 측정 VO
				teethMeasureVO.setUserId(userId);
				// 측정 값 보이는 개수
				teethMeasureVO.setLimit(limit);
				// 측정일 목록 조회
				measureDtList = teethService.selectUserMeasureDtList(userId);

				if( measureDtList.size() > 0) {
					// 최근 측정일
					measureDt = measureDtList.get(0);
				}else {
					model.addAttribute("loginUrl", loginUrl);
					model.addAttribute("msg", "측정 기록이 없습니다.");
					return "/common/alertMessage";
				}
				
				// 자녀(피측정자) 최근 치아 측정 값 조회
				teethMeasureVO = teethService.selectUserMeasureValue(userId, measureDt);
				// 관리자 측 수정 여부 확인
				diagDescriptFl = teethMeasureVO.getDiagDescriptFl();
		
				// 치아 측정 값 배열 (혼합치 배열) 
				// 변경전 유치 배열 34~53까지 20개
				babyTeethValueArray[0] = teethMeasureVO.getT34();
				babyTeethValueArray[1] = teethMeasureVO.getT35();
				babyTeethValueArray[2] = teethMeasureVO.getT36();
				// 영구치 T07
				babyTeethValueArray[3] = teethMeasureVO.getT37();
				// 영구치 T08
				babyTeethValueArray[4] = teethMeasureVO.getT38();
				// 영구치 T09
				babyTeethValueArray[5] = teethMeasureVO.getT39();
				// 영구치 T10
				babyTeethValueArray[6] = teethMeasureVO.getT40();
				babyTeethValueArray[7] = teethMeasureVO.getT41();
				babyTeethValueArray[8] = teethMeasureVO.getT42();
				babyTeethValueArray[9] = teethMeasureVO.getT43();
				babyTeethValueArray[10] = teethMeasureVO.getT46();
				babyTeethValueArray[11] = teethMeasureVO.getT47();
				babyTeethValueArray[12] = teethMeasureVO.getT48();
				// 영구치 T23
				babyTeethValueArray[13] = teethMeasureVO.getT49();
				// 영구치 T24
				babyTeethValueArray[14] = teethMeasureVO.getT50();
				// 영구치 T25
				babyTeethValueArray[15] = teethMeasureVO.getT51();
				// 영구치 T26
				babyTeethValueArray[16] = teethMeasureVO.getT52();
				babyTeethValueArray[17] = teethMeasureVO.getT53();
				babyTeethValueArray[18] = teethMeasureVO.getT54();
				babyTeethValueArray[19] = teethMeasureVO.getT55();
		
				// 영구치 어금니 - 16, 26, 36, 46
				permanentMolarsValueArray[0] = teethMeasureVO.getT33();
				permanentMolarsValueArray[1] = teethMeasureVO.getT44();
				permanentMolarsValueArray[2] = teethMeasureVO.getT45();
				permanentMolarsValueArray[3] = teethMeasureVO.getT56();
				
				// 영구치 상악
				permTeethValueArray[0] = teethMeasureVO.getT07(); 
				permTeethValueArray[1] = teethMeasureVO.getT08(); 
				permTeethValueArray[2] = teethMeasureVO.getT09(); 
				permTeethValueArray[3] = teethMeasureVO.getT10(); 
				
				// 영구치 하악
				permTeethValueArray[4] = teethMeasureVO.getT23(); 
				permTeethValueArray[5] = teethMeasureVO.getT24(); 
				permTeethValueArray[6] = teethMeasureVO.getT25(); 
				permTeethValueArray[7] = teethMeasureVO.getT26(); 
				
				// 갯수 카운팅을 위한 임시 배열
				tmpBabyTeethValueArray[0] = teethMeasureVO.getT37();
				tmpBabyTeethValueArray[1] = teethMeasureVO.getT38();
				tmpBabyTeethValueArray[2] = teethMeasureVO.getT39();
				tmpBabyTeethValueArray[3] = teethMeasureVO.getT40();
				tmpBabyTeethValueArray[4] = teethMeasureVO.getT49();
				tmpBabyTeethValueArray[5] = teethMeasureVO.getT50();
				tmpBabyTeethValueArray[6] = teethMeasureVO.getT51();
				tmpBabyTeethValueArray[7] = teethMeasureVO.getT52();
				
				// 자녀(피측정자) 진단 코드 조회
				userDiagCd = teethMeasureVO.getDiagCd();
				
				// 충치 단계 조회 (주의, 충치)
				cautionLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_CAUTION")));
				dangerLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_DANGER")));
				
				
				/** 유치 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < babyTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (babyTeethValueArray[i] > 1000) {
						babyTeethValueArray[i] = (int) babyTeethValueArray[i] - 1000;
					}
					if (babyTeethValueArray[i] < cautionLevel) { // 정상 치아는 -99이상 체크
						babyCvNormalCnt++;
					} else if (babyTeethValueArray[i] >= cautionLevel && babyTeethValueArray[i] < dangerLevel) {
						babyCvCautionCnt++;
					} else if (babyTeethValueArray[i] >= dangerLevel) {
						babyCvDangerCnt++;
					}
				}
				
				/** 영구치 상악 하악 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < permTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (permTeethValueArray[i] > 1000) {
						permTeethValueArray[i] = (int) permTeethValueArray[i] - 1000;
					}
					if (permTeethValueArray[i] >= cautionLevel && permTeethValueArray[i] < dangerLevel) {
						pmCvCautionCnt++;
					} else if (permTeethValueArray[i] >= dangerLevel) {
						pmCvDangerCnt++;
					}
				}
				
				for(int i=0; i < tmpBabyTeethValueArray.length; i++) {
					if (tmpBabyTeethValueArray[i] > 1000) {
						tmpBabyTeethValueArray[i] = (int) tmpBabyTeethValueArray[i] - 1000;
					}	
				}
				
				/** 영구치와 유치 두 개 다 값이 있을 경우  **/
				for(int i=0; i<8; i++) {
					if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] > 0) {
						
						if(tmpBabyTeethValueArray[i] >= cautionLevel && tmpBabyTeethValueArray[i] < dangerLevel) { // 유치의 값이 주의 단계와 같거나 크고 주의 단계보다 작을 때 :: 범위는 주의 단계 이므로 유치의 주의 단계의 개수를 차감
							babyCvCautionCnt--;
						}else if(tmpBabyTeethValueArray[i]  > dangerLevel) { // 유치의 값이 위험 단계보다 클때 :: 범위는 위험 단계 이므로 유치의 위험 단계의 개수를 차감
							babyCvDangerCnt--;
						}
					}

					// 영구치 측정 값이 있고 유치 측정값이 0이거나 -99일때 정상치아 갯수를 -1해준다
					if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] <=0) {
						babyCvNormalCnt--;
					}
				}
				
				/** 영구치 어금니 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < permanentMolarsValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (permanentMolarsValueArray[i] > 1000) {
						permanentMolarsValueArray[i] = (int) permanentMolarsValueArray[i] - 1000;
					}
					if (permanentMolarsValueArray[i] >= cautionLevel && permanentMolarsValueArray[i] < dangerLevel) {
						pmCvCautionCnt++;
					} else if (permanentMolarsValueArray[i] >= dangerLevel) {
						pmCvDangerCnt++;
					}
				}
				
				double deteriorateScore = (babyCvCautionCnt * cavityCautionScore) + (babyCvDangerCnt * cavityDangerScore) + (pmCvCautionCnt * permCavityCautionScore) + (pmCvDangerCnt * permCavityDangerScore);
				teethMeasureVO.setDeteriorateScore(deteriorateScore);
				
				// 관리자 수정 여부 확인
				if (diagDescriptFl.equals("N")) {
					if (userDiagCd != null && !"".equals(userDiagCd)) {
						diagCdArray = userDiagCd.split("\\|");
						List<String> list = new ArrayList<String>();
						diagDescript = "";
						for (int i = 0; i < diagCdArray.length; i++) {
							String[] diagCdStrArray = diagCdArray[i].split(":");
							if ("1".equals(diagCdStrArray[2])) {
								diagCdStr = diagCdStrArray[0] + diagCdStrArray[1];
								list.add(diagCdStr);
								if(diagCdStr.startsWith("A00") || diagCdStr.equals("B006") ||diagCdStr.equals("E003")) {
									list.add("GA1");
								}
								// 진단 코드 존재 유무
								isDiagCnt++;
							}
						}
						// GA1 중복제거
						list = list.stream().distinct().collect(Collectors.toList());
						if(list.contains("GA1")){
							// 중복 제거 후 마지막에 다시 붙여주는 작업
							list.remove("GA1");
							list.add("GA1");
						}
						
						for(int i=0; i<list.size(); i++) {
							diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript(list.get(i), "M");
						}

						// 진단 키워드를 누르지 않으면 카운팅이 없으므로 이상없음
						if (isDiagCnt == 0) { // 하드코딩
							String diagTitle = diagnosisService.selectDiagTitle("", "M");
							userDiagCd = userDiagCd.replaceAll("E:003:0", "E:003:1");
							diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript("E003", "M") + "<br/>";
							diagDescript = diagDescript.replaceAll("			", "");
							teethMeasureVO.setDiagTitle(diagTitle);
							teethMeasureVO.setDiagCd(userDiagCd);
						}
						diagDescript = diagDescript.replaceAll("			", "");
						teethMeasureVO.setDiagDescript(diagDescript);
					}
				}else {
					diagDescript = teethMeasureVO.getDiagDescript();
				}
				
				if(diagDescriptFl.equals("N")) {
					//진단 설명 : 진단 코드로 진단명을 검색하여 진단에 대한 설명 등록
					if (userDiagCd != null && !"".equals(userDiagCd)) {
						diagCdTitleArray = userDiagCd.split("\\|");
						for (int i = 0; i < diagCdTitleArray.length; i++) {
							String diagTitle = diagnosisService.selectDiagTitle(diagCdTitleArray[i], "M");
							if (diagTitle != null) {
								teethMeasureVO.setDiagTitle(diagTitle);
								break;
							}
						}
						teethMeasureVO.setDiagCd(userDiagCd);
					}
				}
		
				// 진단 화면 표시 유치 정상 개수
				sheetNormalCnt = babyCvNormalCnt + pmCvNomalCnt;
				// 진단 화면 표시 유치 주의 개수
				sheetCautionCnt = babyCvCautionCnt + pmCvCautionCnt;
				// 진단 화면 표시 유치 위험 개수
				sheetdangerCnt = babyCvDangerCnt + pmCvDangerCnt;
		
				// 자녀(피측정자) 이름 등록
				teethMeasureVO.setUserName(userName);
		
				// 유치 정상, 주의, 충치 개수 입력
				teethMeasureVO.setCavityNormal(babyCvNormalCnt);
				teethMeasureVO.setCavityCaution(babyCvCautionCnt);
				teethMeasureVO.setCavityDanger(babyCvDangerCnt);
				// 영구치 정상, 주의, 충치 개수 입력
				teethMeasureVO.setPermCavityNormal(pmCvNomalCnt);
				teethMeasureVO.setPermCavityCaution(pmCvCautionCnt);
				teethMeasureVO.setPermCavityDanger(pmCvDangerCnt);
		
				// 진단 상세 정보 업데이트
				teethService.updateDiagDescript(userId, measureDt, diagDescript);
				// ST_STUDENT_USER_DETAIL 테이블에 CavityCnt 업데이트
				teethService.updateUserCavityCntByMeasureDt(teethMeasureVO);
				
				returnUrl =  "/web/statistics/diagnosis_main";
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		model.addAttribute("dataList", teethMeasureVO);
		model.addAttribute("schoolCode", schoolCode);
		model.addAttribute("measureDtList", measureDtList);
		model.addAttribute("cautionLevel", cautionLevel);
		model.addAttribute("dangerLevel", dangerLevel);
		model.addAttribute("cavityNormal", sheetNormalCnt);
		model.addAttribute("cavityCaution", sheetCautionCnt);
		model.addAttribute("cavityDanger", sheetdangerCnt);
		
		return returnUrl; 	   
		
	}
	
	

	/**
	 * WEB
	 * 기능 : 진단지 조회 (측정일 선택 시 작동)
	 * 작성자 : 정주현
	 * 작성일 : 2022. 11. 28
	 * 수정일 : 2023. 08. 03
	 */
	@PostMapping(value = { "/web/statistics/general/ajaxDiagnosis"})
	@ResponseBody
	public HashMap<String, Object> ajaxDiagnosis(HttpServletRequest request, HttpSession session, Model model, @RequestBody Map<String, String> paramMap) throws Exception {

		// 리턴 맵
		HashMap<String, Object> hm = new HashMap<String, Object>();
		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		
		if(sessionVO == null) {
			// 세션이 끊겼을 때 code 999를 사용
			hm.put("code", "999");
			return hm;
		}
		
		// 자녀(피측정자) 아이디
		String userId = null;
		// 자녀(피측정자) 이름
		String userName = null;
		// 자녀(피측정자) 치아 형태
		String teethType = null;
		// 기관 코드
		String schoolCode = sessionVO.getSchoolCode();
		// 측정일
		String measureDt = paramMap.get("measureDt");
		
		UserVO userVO = new UserVO();
		
		userId = sessionVO.getUserId();
		// 자녀(피측정자) 정보 조회
		userVO = userService.selectUserInfo(userId);
		teethType = userVO.getTeethType();
		userName = sessionVO.getUserName();
			
		// 유치 개수 20개
		int[] babyTeethValueArray = null;
		// 영구치 개수 8개
		int[] permTeethValueArray = null;
		// 영구치 어금니 개수 4개
		int[] permanentMolarsValueArray = null;
		// 임시 유치 배열 20개
		int[] tmpBabyTeethValueArray = null;
		
		// 충치단계 값(주의)
		Integer cautionLevel = 0;
		// 충치단계 값(위험)
		Integer dangerLevel = 0;
	
		// 정상 유치 개수
		int babyCvNormalCnt = 0;
		// 주의 유치 개수
		int babyCvCautionCnt = 0;
		// 충치 유치 개수
		int babyCvDangerCnt = 0;
	
		// 정상 영구치 개수
		int pmCvNomalCnt = 0;
		// 주의 영구치 개수
		int pmCvCautionCnt = 0;
		// 충치 영구치 개수
		int pmCvDangerCnt = 0;
	
		// 유치+영구치 개수
		int sheetNormalCnt = 0;
		int sheetCautionCnt = 0;
		int sheetdangerCnt = 0;
		
		// 진단 코드
		String userDiagCd = null;
		// 진단 코드 분리한 배열
		String[] diagCdArray;
		// 진단 코드 문자열
		String diagCdStr = null;
		// 진단 코드 별 제목 배열
		String[] diagCdTitleArray;
		// 진단 코드 설명
		String diagDescript = "";
		// 진단 코드 설명 업데이트 여부
		String diagDescriptFl = "";
		// 진단 코드 카운트
		int isDiagCnt = 0;
	
		// 결제 정보에 따라서 보여지는 양을 다르게 조정 :: 기본 값은 3
		int limit = 100;
		
		TeethMeasureVO teethMeasureVO = new TeethMeasureVO();
		List<String> measureDtList = new ArrayList<String>();
		
		// 진단 결과지 ::: 치아 형태 - M(유치원)
		if(teethType.equals("M")) {
			try {
				// 유치 개수 20개
				babyTeethValueArray = new int[20];
				// 영구치 개수 12개
				permTeethValueArray = new int[8];
				// 영구치 어금니 4개
				permanentMolarsValueArray = new int[4];
				// 영구치 위치에 해당하는 임시 유치 배열
				tmpBabyTeethValueArray = new int[8];

				// CAVITY_LEVEL 분류 부분 - 충치 단계별 수치 조회
				HashMap<String, Integer> cavityLevel = teethService.selectCavityLevel();
				
				// 치아 측정 VO
				teethMeasureVO.setUserId(userId);
				// 측정 값 보이는 개수
				teethMeasureVO.setLimit(limit);
				
				// 자녀(피측정자) 최근 치아 측정 값 조회
				teethMeasureVO = teethService.selectUserMeasureValue(userId, measureDt);
				
				diagDescriptFl = teethMeasureVO.getDiagDescriptFl();
		
				babyTeethValueArray[0] = teethMeasureVO.getT34();
				babyTeethValueArray[1] = teethMeasureVO.getT35();
				babyTeethValueArray[2] = teethMeasureVO.getT36();
				// 영구치 T07
				babyTeethValueArray[3] = teethMeasureVO.getT37();
				// 영구치 T08
				babyTeethValueArray[4] = teethMeasureVO.getT38();
				// 영구치 T09
				babyTeethValueArray[5] = teethMeasureVO.getT39();
				// 영구치 T10
				babyTeethValueArray[6] = teethMeasureVO.getT40();
				babyTeethValueArray[7] = teethMeasureVO.getT41();
				babyTeethValueArray[8] = teethMeasureVO.getT42();
				babyTeethValueArray[9] = teethMeasureVO.getT43();
				babyTeethValueArray[10] = teethMeasureVO.getT46();
				babyTeethValueArray[11] = teethMeasureVO.getT47();
				babyTeethValueArray[12] = teethMeasureVO.getT48();
				// 영구치 T23
				babyTeethValueArray[13] = teethMeasureVO.getT49();
				// 영구치 T24
				babyTeethValueArray[14] = teethMeasureVO.getT50();
				// 영구치 T25
				babyTeethValueArray[15] = teethMeasureVO.getT51();
				// 영구치 T26
				babyTeethValueArray[16] = teethMeasureVO.getT52();
				babyTeethValueArray[17] = teethMeasureVO.getT53();
				babyTeethValueArray[18] = teethMeasureVO.getT54();
				babyTeethValueArray[19] = teethMeasureVO.getT55();
		
				// 영구치 어금니 - 16, 26, 36, 46
				permanentMolarsValueArray[0] = teethMeasureVO.getT33();
				permanentMolarsValueArray[1] = teethMeasureVO.getT44();
				permanentMolarsValueArray[2] = teethMeasureVO.getT45();
				permanentMolarsValueArray[3] = teethMeasureVO.getT56();
				
				// 영구치 상악
				permTeethValueArray[0] = teethMeasureVO.getT07(); 
				permTeethValueArray[1] = teethMeasureVO.getT08(); 
				permTeethValueArray[2] = teethMeasureVO.getT09(); 
				permTeethValueArray[3] = teethMeasureVO.getT10(); 

				// 영구치 하악
				permTeethValueArray[4] = teethMeasureVO.getT23(); 
				permTeethValueArray[5] = teethMeasureVO.getT24(); 
				permTeethValueArray[6] = teethMeasureVO.getT25(); 
				permTeethValueArray[7] = teethMeasureVO.getT26(); 
				
				// 갯수 카운팅을 위한 임시 배열
				tmpBabyTeethValueArray[0] = teethMeasureVO.getT37();
				tmpBabyTeethValueArray[1] = teethMeasureVO.getT38();
				tmpBabyTeethValueArray[2] = teethMeasureVO.getT39();
				tmpBabyTeethValueArray[3] = teethMeasureVO.getT40();
				tmpBabyTeethValueArray[4] = teethMeasureVO.getT49();
				tmpBabyTeethValueArray[5] = teethMeasureVO.getT50();
				tmpBabyTeethValueArray[6] = teethMeasureVO.getT51();
				tmpBabyTeethValueArray[7] = teethMeasureVO.getT52();
				
				// 자녀(피측정자) 진단 코드 조회
				userDiagCd = teethMeasureVO.getDiagCd();
				
				// 충치 단계 조회 (주의, 충치)
				cautionLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_CAUTION")));
				dangerLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_DANGER")));
				
				
				/** 유치 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < babyTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (babyTeethValueArray[i] > 1000) {
						babyTeethValueArray[i] = (int) babyTeethValueArray[i] - 1000;
					}
					if (babyTeethValueArray[i] < cautionLevel) { // 정상 치아는 -99이상 체크
						babyCvNormalCnt++;
					} else if (babyTeethValueArray[i] >= cautionLevel && babyTeethValueArray[i] < dangerLevel) {
						babyCvCautionCnt++;
					} else if (babyTeethValueArray[i] >= dangerLevel) {
						babyCvDangerCnt++;
					}
				}
				
				/** 영구치 상악 하악 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < permTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (permTeethValueArray[i] > 1000) {
						permTeethValueArray[i] = (int) permTeethValueArray[i] - 1000;
					}
					if (permTeethValueArray[i] >= cautionLevel && permTeethValueArray[i] < dangerLevel) {
						pmCvCautionCnt++;
					} else if (permTeethValueArray[i] >= dangerLevel) {
						pmCvDangerCnt++;
					}
				}
				
				for(int i=0; i < tmpBabyTeethValueArray.length; i++) {
					if (tmpBabyTeethValueArray[i] > 1000) {
						tmpBabyTeethValueArray[i] = (int) tmpBabyTeethValueArray[i] - 1000;
					}	
				}
				
				/** 영구치와 유치 두 개 다 값이 있을 경우  **/
				for(int i=0; i<8; i++) {
					if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] > 0) {
						if(tmpBabyTeethValueArray[i] >= cautionLevel && tmpBabyTeethValueArray[i] < dangerLevel) { // 유치의 값이 주의 단계와 같거나 크고 주의 단계보다 작을 때 :: 범위는 주의 단계 이므로 유치의 주의 단계의 개수를 차감
							babyCvCautionCnt--;
						}else if(tmpBabyTeethValueArray[i]  > dangerLevel) { // 유치의 값이 위험 단계보다 클때 :: 범위는 위험 단계 이므로 유치의 위험 단계의 개수를 차감
							babyCvDangerCnt--;
						}
					}
					// 영구치 측정 값이 있고 유치 측정값이 0이거나 -99일때 정상치아 갯수를 -1해준다
					if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] <=0) {
						babyCvNormalCnt--;
					}
				}
				
				/** 영구치 어금니 정상, 주의, 충치 개수 저장 **/
				for (int i = 0; i < permanentMolarsValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
					if (permanentMolarsValueArray[i] > 1000) {
						permanentMolarsValueArray[i] = (int) permanentMolarsValueArray[i] - 1000;
					}
					if (permanentMolarsValueArray[i] >= cautionLevel && permanentMolarsValueArray[i] < dangerLevel) {
						pmCvCautionCnt++;
					} else if (permanentMolarsValueArray[i] >= dangerLevel) {
						pmCvDangerCnt++;
					}
				}
				
				if (diagDescriptFl.equals("N")) {
					if (userDiagCd != null && !"".equals(userDiagCd)) {
						diagCdArray = userDiagCd.split("\\|");
						List<String> list = new ArrayList<String>();
						diagDescript = "";
						for (int i = 0; i < diagCdArray.length; i++) {
							String[] diagCdStrArray = diagCdArray[i].split(":");
							if ("1".equals(diagCdStrArray[2])) {
								diagCdStr = diagCdStrArray[0] + diagCdStrArray[1];
								list.add(diagCdStr);
								if(diagCdStr.startsWith("A00") || diagCdStr.equals("B006") ||diagCdStr.equals("E003")) {
									list.add("GA1");
								}
								// 진단 코드 존재 유무
								isDiagCnt++;
							}
						}
						// GA1 중복제거
						list = list.stream().distinct().collect(Collectors.toList());
						if(list.contains("GA1")){
							// 중복 제거 후 마지막에 다시 붙여주는 작업
							list.remove("GA1");
							list.add("GA1");
						}
						
						for(int i=0; i<list.size(); i++) {
							diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript(list.get(i), teethType);
						}
					
						// 진단 키워드를 누르지 않으면 카운팅이 없으므로 이상없음
						if (isDiagCnt == 0) { // 하드코딩
							String diagTitle = diagnosisService.selectDiagTitle("", teethType);
							userDiagCd = userDiagCd.replaceAll("E:003:0", "E:003:1");
							diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript("E003", teethType) + "<br/>";
							diagDescript = diagDescript.replaceAll("			", "");
							teethMeasureVO.setDiagTitle(diagTitle);
							teethMeasureVO.setDiagCd(userDiagCd);
						}
						diagDescript = diagDescript.replaceAll("			", "");
						teethMeasureVO.setDiagDescript(diagDescript);
					}
				}else {
					diagDescript = teethMeasureVO.getDiagDescript();
				}
				
				
				if(diagDescriptFl.equals("N")) {
					//진단 설명 : 진단 코드로 진단명을 검색하여 진단에 대한 설명 등록
					if (userDiagCd != null && !"".equals(userDiagCd)) {
						diagCdTitleArray = userDiagCd.split("\\|");
						for (int i = 0; i < diagCdTitleArray.length; i++) {
							String diagTitle = diagnosisService.selectDiagTitle(diagCdTitleArray[i], teethType);
							if (diagTitle != null) {
								teethMeasureVO.setDiagTitle(diagTitle);
								break;
							}
						}
						teethMeasureVO.setDiagCd(userDiagCd);
					}
				}
		
				// 진단 화면 표시 유치 정상 개수
				sheetNormalCnt = babyCvNormalCnt + pmCvNomalCnt;
				// 진단 화면 표시 유치 주의 개수
				sheetCautionCnt = babyCvCautionCnt + pmCvCautionCnt;
				// 진단 화면 표시 유치 위험 개수
				sheetdangerCnt = babyCvDangerCnt + pmCvDangerCnt;
		
				// 자녀(피측정자) 이름 등록
				teethMeasureVO.setUserName(userName);
		
				// 유치 정상, 주의, 충치 개수 입력
				teethMeasureVO.setCavityNormal(babyCvNormalCnt);
				teethMeasureVO.setCavityCaution(babyCvCautionCnt);
				teethMeasureVO.setCavityDanger(babyCvDangerCnt);
				// 영구치 정상, 주의, 충치 개수 입력
				teethMeasureVO.setPermCavityNormal(pmCvNomalCnt);
				teethMeasureVO.setPermCavityCaution(pmCvCautionCnt);
				teethMeasureVO.setPermCavityDanger(pmCvDangerCnt);
		
				// 진단 상세 정보 업데이트
				teethService.updateDiagDescript(userId, measureDt, diagDescript);
				// ST_STUDENT_USER_DETAIL 테이블에 CavityCnt 업데이트
				teethService.updateUserCavityCntByMeasureDt(teethMeasureVO);

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}
		
		hm.put("code", "000");

		hm.put("dataList", teethMeasureVO);
		hm.put("schoolCode", schoolCode);
		hm.put("measureDtList", measureDtList);
		hm.put("cautionLevel", cautionLevel);
		hm.put("dangerLevel", dangerLevel);
		hm.put("cavityNormal", sheetNormalCnt);
		hm.put("cavityCaution", sheetCautionCnt);
		hm.put("cavityDanger", sheetdangerCnt);

		return hm;

	}
	
	
	
	/**
	 * WEB (유치원, 어린이집 조회)
	 * 기능 : 그래프 조회 - 학교,유치원,어린이집
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 24
	 */
	@GetMapping(value = { "/web/statistics/general/graph.do" })
	// location.href로 요청이 들어옴
	public String graph(HttpServletRequest request, HttpSession session, Model model) {

		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		String returnUrl = null;

		if (sessionVO == null) {
			return "/web/login/schoolLoginForm";
		}
		 
		try {

			String userId = null;
			String userName = null;
			String schoolCode = sessionVO.getSchoolCode();
			
			userId = sessionVO.getUserId();
			userName = sessionVO.getUserName();
			
			String measureDt = null;
			String schoolName = null;

			double deteriorateMaxScore = 0;

			// 결제 정보에 따라서 보여지는 양을 다르게 조정 :: 기본 값은 3
			int limit = 100;

			TeethMeasureVO webTeethMeasureVO = new TeethMeasureVO();
			List<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
			List<String> measureDtList = new ArrayList<String>();
			List<Double> deteriorateScordList = new ArrayList<Double>();
			List<Integer> cavityCntList = new ArrayList<Integer>();
			List<String> userNameList = new ArrayList<String>();
			List<Double> userFearScoreList = new ArrayList<Double>();

			// 기관 코드
			schoolCode = sessionVO.getSchoolCode();
			// 치아 측정 VO
			webTeethMeasureVO.setUserId(userId);
			webTeethMeasureVO.setLimit(limit);
			// 자녀(피측정자) 치아 측정일 목록
			measureDtList = teethService.selectUserMeasureDtList(userId);
			// 최근 측정일
			measureDt = measureDtList.get(0);
			// 기관 내 자녀(피측정자) 데이터 통계 작업 후 조회
			dataList = teethService.selectUserMeasureStatisticsList(schoolCode, measureDt);
			// 기관명 
			schoolName = (String)dataList.get(0).get("SCHOOL_NAME");
			
			for (int i = 0; i < dataList.size(); i++) {
				// 악화 지수 초기화
				double fearScore = 0;
				// 자녀(피측정자) 아이디
				String stUserName = (String) dataList.get(i).get("USER_NAME");
				// 자녀(피측정자) 진단 태그 항목
				String diagCd = (String) dataList.get(i).get("DIAG_CD");
				// 자녀(피측정자) 개월 수
				long monthcount = (long) dataList.get(i).get("MONTH_COUNT");
				// 자녀(피측정자) 악화지수
				double deteriorateScore = 0;

				// 유치 및 영구치 >>  주의(caution) 치아 및 충치(danger) 치아 개수
				int cavityDangerCnt = Integer.parseInt(dataList.get(i).get("CAVITY_DANGER").toString());
				int permCavityDangerCnt = Integer.parseInt(dataList.get(i).get("PERM_CAVITY_DANGER").toString());
				
				// 악화 지수
				deteriorateScore = (double) dataList.get(i).get("DETERIORATE_SCORE");
				// 악화 지수 최대값 저장
				if (deteriorateMaxScore < deteriorateScore) {
					deteriorateMaxScore = deteriorateScore;
				}

				// 진단지 조회한 회원과 이름리스트의 이름이 일치하지 않을 경우 = 001~999 로 표기
				if (!userName.equals(stUserName)) {
					stUserName = "\'" + String.format("%03d", i + 1) + "(" + monthcount + ")\'";
				} else {
					stUserName = "\'" + stUserName + "(" + monthcount + ")\'";
				}

				if (deteriorateScore > 0 && diagCd.contains("A:22:1")) {
					// 측정 두려움 항목이 있을 경우 *별표 표시
					stUserName = stUserName.replaceAll("'", "");
					stUserName = "\'" + stUserName + "*\'";
					fearScore = 0;
				} else if (diagCd.contains("A:22:1")) {
					// 측정 두려움 항목만 있을 경우 MAX 값을 지정
					fearScore = Math.round(deteriorateMaxScore);
				}

				if(fearScore % 5 != 0) {
					int calFearScore = (int)fearScore % 5;
					switch(calFearScore) {
					case 1: fearScore = fearScore+4.0;
						break;
					case 2: fearScore = fearScore+3.0;
						break;
					case 3: fearScore = fearScore+2.0;
						break;
					case 4: fearScore = fearScore+1.0;
						break;
					}
				}
				userNameList.add(stUserName);
				userFearScoreList.add(fearScore);
				// 충치에 대한 내용만 그래프에 값으로 표시가 되므로 주의에 대한 값은 필요 없음
				cavityCntList.add(cavityDangerCnt + permCavityDangerCnt);
				deteriorateScordList.add(deteriorateScore);
			}
			
			
			// 자녀(피측정자) 아이디
			model.addAttribute("userId", userId);
			// 자녀(피측정자) 이름
			model.addAttribute("userName", userName);
			// 자녀(피측정자) 소속 기관 코드
			model.addAttribute("schoolCode", schoolCode);
			// 자녀(피측정자) 소속 기관 이름
			model.addAttribute("schoolName", schoolName);
			
			// 기관 내 측정 인원 수
			model.addAttribute("userCount", dataList.size());
			// 치아 측정일 목록
			model.addAttribute("measureDtList", measureDtList);
			// 기관 내 측정 인원 이름 목록
			model.addAttribute("userNameList", userNameList);
			// 기관 내 측정 인원 악화 지수 목록
			model.addAttribute("deteriorateScordList", deteriorateScordList);
			// 기관 내 측정 인원 충치 개수 목록
			model.addAttribute("cavityCntList", cavityCntList);
			// 기관 내 측정 두려움 인원 목록
			model.addAttribute("userFearScoreList", userFearScoreList);
			
			returnUrl =  "/web/statistics/graph_main";

		} catch (Exception e) {
			model.addAttribute("msg", "세션시간이 만료되었습니다. 다시 로그인해주시기 바랍니다.");
			model.addAttribute("loginUrl", loginUrl + "/login");
			returnUrl = "/common/alertMessage";
		}
		
		return returnUrl;
		
	}
	
	
	
	/**
	 * WEB (유치원, 어린이집 조회)
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 30
	 * 기능 : 그래프 조회 - selectbox (파라미터 : 측정일)
	 */
	@SuppressWarnings("unused")
	@PostMapping(value = { "/web/statistics/general/ajaxGraph"})
	@ResponseBody
	public HashMap<String, Object> ajaxGraph(HttpServletRequest request, HttpSession session, Model model, @RequestBody Map<String, String> paramMap) throws Exception {

		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		try {
			
			// 자녀(피측정자) 아이디
			String userId = (String)paramMap.get("userId");
			// 자녀(피측정자) 이름
			String userName = sessionVO.getUserName();
			// 측정일
			String measureDt = (String)paramMap.get("measureDt");
			// 기관코드
			String schoolCode = sessionVO.getSchoolCode();
			// 악화지수 최대 값
			double deteriorateMaxScore = 0;

			TeethMeasureVO webTeethMeasureVO = new TeethMeasureVO();
			List<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
			List<Double> deteriorateScordList = new ArrayList<Double>();
			List<Integer> cavityCntList = new ArrayList<Integer>();
			List<String> userNameList = new ArrayList<String>();
			List<Double> userFearScoreList = new ArrayList<Double>();
			
			// 법정대리인 아이디로 자녀(피측정자) 이름 조회
			// userName = userService.selectChUserName(userId);
			// 기관 내 자녀(피측정자) 데이터 통계 작업 후 조회
			dataList = teethService.selectUserMeasureStatisticsList(schoolCode, measureDt);

			for (int i = 0; i < dataList.size(); i++) {
				// 두려움 지수
				double fearScore = 0;
				// 악화지수 초기화
				double deteriorateScore = 0;
				// 자녀(피측정자) 아이디
				String studentUserId = (String) dataList.get(i).get("USER_ID");
				// 자녀(피측정자) 이름
				String studentUserName = (String) dataList.get(i).get("USER_NAME");
				// 자녀(피측정자) 진단 태그 항목
				String diagCd = (String) dataList.get(i).get("DIAG_CD");
				// 자녀(피측정자) 개월 수
				long monthcount = (long) dataList.get(i).get("MONTH_COUNT");

				// 유치 및 영구치 >>  주의(caution) 치아 및 충치(danger) 치아 개수
				int cavityCautionCnt = Integer.parseInt(dataList.get(i).get("CAVITY_CAUTION").toString());
				int cavityDangerCnt = Integer.parseInt(dataList.get(i).get("CAVITY_DANGER").toString());
				int permCavityCautionCnt = Integer.parseInt(dataList.get(i).get("PERM_CAVITY_CAUTION").toString());
				int permCavityDangerCnt = Integer.parseInt(dataList.get(i).get("PERM_CAVITY_DANGER").toString());

				// 악화지수
				deteriorateScore = (double) dataList.get(i).get("DETERIORATE_SCORE");
				// 악화지수 최대값 저장
				if (deteriorateMaxScore < deteriorateScore) {
					deteriorateMaxScore = deteriorateScore;
				}

				//if(selectUserType != null && !selectUserType.equals("")) {
				//stUserName = stUserName + "(" + monthcount + ")";
				//}else {
					// 진단지 조회한 회원과 이름리스트의 이름이 일치하지 않을 경우 = 001~999로 표기
					if (!userName.equals(studentUserName)) {
						studentUserName = String.format("%03d", i + 1) + "(" + monthcount + ")";
					} else {
						studentUserName = studentUserName + "(" + monthcount + ")";
					}
				//}
				
				// 두려움에 대한 처리 (하드코딩)
				if (deteriorateScore > 0 && diagCd.contains("E:001:1")) {
					// 측정 두려움 항목이 있을 경우 *별표 표시
					studentUserName = studentUserName.replaceAll("'", "");
					studentUserName = "\'" + studentUserName + "*\'";
					fearScore = 0;
				} else if (diagCd.contains("E:001:1")) {
					// 측정 두려움 항목만 있을 경우 MAX 값을 지정
					fearScore = Math.round(deteriorateMaxScore);
				}

				if(fearScore % 5 != 0) {
					int calFearScore = (int)fearScore % 5;
					switch(calFearScore) {
					case 1: fearScore = fearScore+4.0;
						break;
					case 2: fearScore = fearScore+3.0;
						break;
					case 3: fearScore = fearScore+2.0;
						break;
					case 4: fearScore = fearScore+1.0;
						break;
					}
				}
				userNameList.add(studentUserName);
				userFearScoreList.add(fearScore);
				cavityCntList.add(cavityDangerCnt + permCavityDangerCnt);
				deteriorateScordList.add(deteriorateScore);
			}
			
			// 자녀(피측정자) 아이디
			hm.put("userId", userId);
			// 자녀(피측정자) 이름
			hm.put("userName", userName);
			// 자녀(피측정자) 소속 기관 코드
			hm.put("schoolCode", schoolCode);
			// 기관 내 측정 인원 수
			hm.put("userCount", dataList.size());
			// 기관 내 측정 인원 이름 목록
			hm.put("userNameList", userNameList);
			// 기관 내 측정 인원 악화 지수 목록
			hm.put("deteriorateScordList", deteriorateScordList);
			// 기관 내 측정 인원 충치 개수 목록
			hm.put("cavityCntList", cavityCntList);
			// 기관 내 측정 두려움 인원 목록
			hm.put("userFearScoreList", userFearScoreList);
			
			hm.put("code", "000");
			hm.put("msg", "success");
			return hm;

		} catch (Exception e) {

			e.printStackTrace();
			hm.put("code", "500");
			hm.put("msg", "Server Error");
			return hm;
			
		}
	}
	
	
	
	/**
	 * WEB (유치원, 어린이집 조회)
	 * 기능 : 기관장용 - 진단지 & 그래프 통합
	 * 작성자 : 정주현
	 * 작성일 : 2022. 12. 07
	 */
	@GetMapping(value = { "/web/statistics/integrateStatistics.do"})
	public String integrateStatistics(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		
		if (sessionVO == null) {
			model.addAttribute("msg", "세션시간이 만료되었습니다. 다시 로그인해주시기 바랍니다.");
			model.addAttribute("loginUrl", loginUrl+"/director/login");
			return "/common/alertMessage";
		}
		
		String userId = null;
		String userName = null;
		String schoolCode = sessionVO.getSchoolCode();
		String schoolName = null;
		String classCode = null;
		int userCount = 0;
		
		// 최근 측정일
		String measureDt = request.getParameter("measureDt");
		
		// 충치단계 값(주의)
		Integer cautionLevel = 0;
		// 충치단계 값(위험)
		Integer dangerLevel = 0;

		// CAVITY_LEVEL 분류 부분 - 충치 단계별 수치 조회
		HashMap<String, Integer> cavityLevel = teethService.selectCavityLevel();
		
		List<HashMap<String, Object>> measureDtListMap = new ArrayList<HashMap<String, Object>> ();
		List<String> organMeasureDtList = new ArrayList<String>();
		
		List<HashMap<String, Object>> departmentList = new ArrayList<HashMap<String, Object>>();
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		Map<Integer, List<HashMap<String, Object>>> departmentUserList = new HashMap<Integer, List<HashMap<String, Object>>>();
		
		List<String> userNameList = new ArrayList<String>();
		
		try {
			// 데이터베이스의 충치 단계 조회 (주의, 충치)
			cautionLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_CAUTION")));
			dangerLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_DANGER")));
	
			
			// 측정일 목록
			measureDtListMap = organService.selectOrganMeasureDtList(schoolCode);
			for(int i=0; i<measureDtListMap.size(); i++) {
				organMeasureDtList.add((String) measureDtListMap.get(i).get("MEASURE_DT"));
			}
			
			if(measureDt == null || measureDt.equals("")) {
				if( measureDtListMap.size() > 0) {
					measureDt = (String)measureDtListMap.get(0).get("MEASURE_DT");
				}else {
					// 측정일, 측정인원이 없을 경우
					model.addAttribute("msg", "측정 기록이 없습니다.");
					model.addAttribute("loginUrl", loginUrl+"/web/statistics/director/logout.do");
					return "/common/alertMessage";
				}
			}
			
			// 부서 목록
			departmentList = organService.selectClassList(schoolCode);
			// 부서 이름
			schoolName = (String)departmentList.get(0).get("SCHOOL_NAME");
			// 피측정자 인원 수
			userCount = departmentList.size();

			for(int i=0; i<departmentList.size(); i++) {
				// 부서 코드
				classCode = (String) departmentList.get(i).get("CLASS_CODE");
				// 부서 내 피측정자 인원 목록
				list = userService.selectDepartUserList(classCode, measureDt);
				if(list != null || list.size() != 0) {
					for(int j=0; j<list.size(); j++) {
						userNameList.add((String) list.get(j).get("USER_NAME"));
					}
					departmentUserList.put(i, list);
				}
			}

			// 피측정자 아이디
			userId = (String)departmentUserList.get(0).get(0).get("USER_ID");
			// 피측정자 이름
			userName = (String)departmentUserList.get(0).get(0).get("USER_NAME");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		// 첫번째 반 첫번째 학생 정보
		model.addAttribute("userId", userId);
		model.addAttribute("userName", userName);
		// 측정일
		model.addAttribute("measureDt", measureDt);
		// 메뉴 탭 :: 반목록
		model.addAttribute("departmentList", departmentList);
		// 메뉴 탭 :: 학생 목록
		model.addAttribute("departmentUserList", departmentUserList);
		// 그래프 파라미터
		model.addAttribute("schoolName", schoolName);
		model.addAttribute("userNameList", userNameList);
		model.addAttribute("userCount", userCount);
		// 측정일 목록
		model.addAttribute("organMeasureDtList", organMeasureDtList);
		// 결과지 파라미터
		model.addAttribute("cautionLevel", cautionLevel);
		model.addAttribute("dangerLevel", dangerLevel);

		return "/web/statistics/integrateStatistics";

	}
	
	
	
	/**
	 * WEB (유치원, 어린이집 조회)
	 * 기능 : 기관장용 - 결과지 조회 (측정일 선택 시 작동)
	 * 작성자 : 정주현
	 * 작성일 : 2022. 11. 28
	 * 수정일 : 2023. 08. 03
	 */
	@PostMapping(value = { "/web/statistics/director/ajaxDiagnosis"})
	@ResponseBody
	public HashMap<String, Object> directorAjaxDiagnosis(HttpServletRequest request, HttpSession session, Model model, @RequestBody Map<String, String> paramMap) throws Exception {

		// 리턴 맵
		HashMap<String, Object> hm = new HashMap<String, Object>();
		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		
		if(sessionVO == null) {
			// 세션이 끊겼을 때 code 999를 사용
			hm.put("code", "999");
			return hm;
		}
		
		UserVO userVO = new UserVO();
		
		// 자녀(피측정자) 아이디
		String userId = paramMap.get("userId");
		userVO = userService.selectUserInfo(userId);
		// 자녀(피측정자) 이름
		String userName = userVO.getUserName();
		
		// 자녀(피측정자) 치아 형태 - 하드코딩
		String teethType = "M";
		// 기관 코드
		String schoolCode = sessionVO.getSchoolCode();
		// 측정일
		String measureDt = paramMap.get("measureDt");
			
		// 유치 개수 20개
		int[] babyTeethValueArray = null;
		// 영구치 개수 8개
		int[] permTeethValueArray = null;
		// 영구치 어금니 개수 4개
		int[] permanentMolarsValueArray = null;
		// 임시 유치 배열 20개
		int[] tmpBabyTeethValueArray = null;
		
		// 충치단계 값(주의)
		Integer cautionLevel = 0;
		// 충치단계 값(위험)
		Integer dangerLevel = 0;
	
		// 정상 유치 개수
		int babyCvNormalCnt = 0;
		// 주의 유치 개수
		int babyCvCautionCnt = 0;
		// 충치 유치 개수
		int babyCvDangerCnt = 0;
	
		// 정상 영구치 개수
		int pmCvNomalCnt = 0;
		// 주의 영구치 개수
		int pmCvCautionCnt = 0;
		// 충치 영구치 개수
		int pmCvDangerCnt = 0;
	
		// 유치+영구치 개수
		int sheetNormalCnt = 0;
		int sheetCautionCnt = 0;
		int sheetdangerCnt = 0;
		
		// 진단 코드
		String userDiagCd = null;
		// 진단 코드 분리한 배열
		String[] diagCdArray;
		// 진단 코드 문자열
		String diagCdStr = null;
		// 진단 코드 별 제목 배열
		String[] diagCdTitleArray;
		// 진단 코드 설명
		String diagDescript = "";
		// 진단 코드 설명 업데이트 여부
		String diagDescriptFl = "";
		// 진단 코드 카운트
		int isDiagCnt = 0;
	
		// 결제 정보에 따라서 보여지는 양을 다르게 조정 :: 기본 값은 3
		int limit = 100;
		
		TeethMeasureVO teethMeasureVO = new TeethMeasureVO();
		List<String> measureDtList = new ArrayList<String>();
		
		// 진단 결과지
		try {
			// 유치 개수 20개
			babyTeethValueArray = new int[20];
			// 영구치 개수 12개
			permTeethValueArray = new int[8];
			// 영구치 어금니 4개
			permanentMolarsValueArray = new int[4];
			// 영구치 위치에 해당하는 임시 유치 배열
			tmpBabyTeethValueArray = new int[8];

			// CAVITY_LEVEL 분류 부분 - 충치 단계별 수치 조회
			HashMap<String, Integer> cavityLevel = teethService.selectCavityLevel();
			
			// 치아 측정 VO
			teethMeasureVO.setUserId(userId);
			// 측정 값 보이는 개수
			teethMeasureVO.setLimit(limit);
			
			// 자녀(피측정자) 최근 치아 측정 값 조회
			teethMeasureVO = teethService.selectUserMeasureValue(userId, measureDt);
			
			diagDescriptFl = teethMeasureVO.getDiagDescriptFl();
	
			babyTeethValueArray[0] = teethMeasureVO.getT34();
			babyTeethValueArray[1] = teethMeasureVO.getT35();
			babyTeethValueArray[2] = teethMeasureVO.getT36();
			// 영구치 T07
			babyTeethValueArray[3] = teethMeasureVO.getT37();
			// 영구치 T08
			babyTeethValueArray[4] = teethMeasureVO.getT38();
			// 영구치 T09
			babyTeethValueArray[5] = teethMeasureVO.getT39();
			// 영구치 T10
			babyTeethValueArray[6] = teethMeasureVO.getT40();
			babyTeethValueArray[7] = teethMeasureVO.getT41();
			babyTeethValueArray[8] = teethMeasureVO.getT42();
			babyTeethValueArray[9] = teethMeasureVO.getT43();
			babyTeethValueArray[10] = teethMeasureVO.getT46();
			babyTeethValueArray[11] = teethMeasureVO.getT47();
			babyTeethValueArray[12] = teethMeasureVO.getT48();
			// 영구치 T23
			babyTeethValueArray[13] = teethMeasureVO.getT49();
			// 영구치 T24
			babyTeethValueArray[14] = teethMeasureVO.getT50();
			// 영구치 T25
			babyTeethValueArray[15] = teethMeasureVO.getT51();
			// 영구치 T26
			babyTeethValueArray[16] = teethMeasureVO.getT52();
			babyTeethValueArray[17] = teethMeasureVO.getT53();
			babyTeethValueArray[18] = teethMeasureVO.getT54();
			babyTeethValueArray[19] = teethMeasureVO.getT55();
	
			// 영구치 어금니 - 16, 26, 36, 46
			permanentMolarsValueArray[0] = teethMeasureVO.getT33();
			permanentMolarsValueArray[1] = teethMeasureVO.getT44();
			permanentMolarsValueArray[2] = teethMeasureVO.getT45();
			permanentMolarsValueArray[3] = teethMeasureVO.getT56();
			
			// 영구치 상악
			permTeethValueArray[0] = teethMeasureVO.getT07(); 
			permTeethValueArray[1] = teethMeasureVO.getT08(); 
			permTeethValueArray[2] = teethMeasureVO.getT09(); 
			permTeethValueArray[3] = teethMeasureVO.getT10(); 

			// 영구치 하악
			permTeethValueArray[4] = teethMeasureVO.getT23(); 
			permTeethValueArray[5] = teethMeasureVO.getT24(); 
			permTeethValueArray[6] = teethMeasureVO.getT25(); 
			permTeethValueArray[7] = teethMeasureVO.getT26(); 
			
			// 갯수 카운팅을 위한 임시 배열
			tmpBabyTeethValueArray[0] = teethMeasureVO.getT37();
			tmpBabyTeethValueArray[1] = teethMeasureVO.getT38();
			tmpBabyTeethValueArray[2] = teethMeasureVO.getT39();
			tmpBabyTeethValueArray[3] = teethMeasureVO.getT40();
			tmpBabyTeethValueArray[4] = teethMeasureVO.getT49();
			tmpBabyTeethValueArray[5] = teethMeasureVO.getT50();
			tmpBabyTeethValueArray[6] = teethMeasureVO.getT51();
			tmpBabyTeethValueArray[7] = teethMeasureVO.getT52();
			
			// 자녀(피측정자) 진단 코드 조회
			userDiagCd = teethMeasureVO.getDiagCd();
			
			// 충치 단계 조회 (주의, 충치)
			cautionLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_CAUTION")));
			dangerLevel = Integer.parseInt(String.valueOf(cavityLevel.get("CAVITY_DANGER")));
			
			
			/** 유치 정상, 주의, 충치 개수 저장 **/
			for (int i = 0; i < babyTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
				if (babyTeethValueArray[i] > 1000) {
					babyTeethValueArray[i] = (int) babyTeethValueArray[i] - 1000;
				}
				if (babyTeethValueArray[i] < cautionLevel) { // 정상 치아는 -99이상 체크
					babyCvNormalCnt++;
				} else if (babyTeethValueArray[i] >= cautionLevel && babyTeethValueArray[i] < dangerLevel) {
					babyCvCautionCnt++;
				} else if (babyTeethValueArray[i] >= dangerLevel) {
					babyCvDangerCnt++;
				}
			}
			
			/** 영구치 상악 하악 정상, 주의, 충치 개수 저장 **/
			for (int i = 0; i < permTeethValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
				if (permTeethValueArray[i] > 1000) {
					permTeethValueArray[i] = (int) permTeethValueArray[i] - 1000;
				}
				if (permTeethValueArray[i] >= cautionLevel && permTeethValueArray[i] < dangerLevel) {
					pmCvCautionCnt++;
				} else if (permTeethValueArray[i] >= dangerLevel) {
					pmCvDangerCnt++;
				}
			}
			
			for(int i=0; i < tmpBabyTeethValueArray.length; i++) {
				if (tmpBabyTeethValueArray[i] > 1000) {
					tmpBabyTeethValueArray[i] = (int) tmpBabyTeethValueArray[i] - 1000;
				}	
			}
			
			/** 영구치와 유치 두 개 다 값이 있을 경우  **/
			for(int i=0; i<8; i++) {
				if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] > 0) {
					if(tmpBabyTeethValueArray[i] >= cautionLevel && tmpBabyTeethValueArray[i] < dangerLevel) { // 유치의 값이 주의 단계와 같거나 크고 주의 단계보다 작을 때 :: 범위는 주의 단계 이므로 유치의 주의 단계의 개수를 차감
						babyCvCautionCnt--;
					}else if(tmpBabyTeethValueArray[i]  > dangerLevel) { // 유치의 값이 위험 단계보다 클때 :: 범위는 위험 단계 이므로 유치의 위험 단계의 개수를 차감
						babyCvDangerCnt--;
					}
				}
				// 영구치 측정 값이 있고 유치 측정값이 0이거나 -99일때 정상치아 갯수를 -1해준다
				if(permTeethValueArray[i] > 0 && tmpBabyTeethValueArray[i] <=0) {
					babyCvNormalCnt--;
				}
			}
			
			/** 영구치 어금니 정상, 주의, 충치 개수 저장 **/
			for (int i = 0; i < permanentMolarsValueArray.length; i++) { // 측정자가 입력한 주의나 충치 값의 -1000
				if (permanentMolarsValueArray[i] > 1000) {
					permanentMolarsValueArray[i] = (int) permanentMolarsValueArray[i] - 1000;
				}
				if (permanentMolarsValueArray[i] >= cautionLevel && permanentMolarsValueArray[i] < dangerLevel) {
					pmCvCautionCnt++;
				} else if (permanentMolarsValueArray[i] >= dangerLevel) {
					pmCvDangerCnt++;
				}
			}
			
			if (diagDescriptFl.equals("N")) {
				if (userDiagCd != null && !"".equals(userDiagCd)) {
					diagCdArray = userDiagCd.split("\\|");
					List<String> list = new ArrayList<String>();
					diagDescript = "";
					for (int i = 0; i < diagCdArray.length; i++) {
						String[] diagCdStrArray = diagCdArray[i].split(":");
						if ("1".equals(diagCdStrArray[2])) {
							diagCdStr = diagCdStrArray[0] + diagCdStrArray[1];
							list.add(diagCdStr);
							if(diagCdStr.startsWith("A00") || diagCdStr.equals("B006") ||diagCdStr.equals("E003")) {
								list.add("GA1");
							}
							// 진단 코드 존재 유무
							isDiagCnt++;
						}
					}
					// GA1 중복제거
					list = list.stream().distinct().collect(Collectors.toList());
					if(list.contains("GA1")){
						// 중복 제거 후 마지막에 다시 붙여주는 작업
						list.remove("GA1");
						list.add("GA1");
					}
					
					for(int i=0; i<list.size(); i++) {
						diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript(list.get(i), teethType);
					}
				
					// 진단 키워드를 누르지 않으면 카운팅이 없으므로 이상없음
					if (isDiagCnt == 0) { // 하드코딩
						String diagTitle = diagnosisService.selectDiagTitle("", teethType);
						userDiagCd = userDiagCd.replaceAll("E:003:0", "E:003:1");
						diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript("E003", teethType) + "<br/>";
						diagDescript = diagDescript.replaceAll("			", "");
						teethMeasureVO.setDiagTitle(diagTitle);
						teethMeasureVO.setDiagCd(userDiagCd);
					}
					diagDescript = diagDescript.replaceAll("			", "");
					teethMeasureVO.setDiagDescript(diagDescript);
				}
			}else {
				diagDescript = teethMeasureVO.getDiagDescript();
			}
			
			
			if(diagDescriptFl.equals("N")) {
				//진단 설명 : 진단 코드로 진단명을 검색하여 진단에 대한 설명 등록
				if (userDiagCd != null && !"".equals(userDiagCd)) {
					diagCdTitleArray = userDiagCd.split("\\|");
					for (int i = 0; i < diagCdTitleArray.length; i++) {
						String diagTitle = diagnosisService.selectDiagTitle(diagCdTitleArray[i], teethType);
						if (diagTitle != null) {
							teethMeasureVO.setDiagTitle(diagTitle);
							break;
						}
					}
					teethMeasureVO.setDiagCd(userDiagCd);
				}
			}
	
			// 진단 화면 표시 유치 정상 개수
			sheetNormalCnt = babyCvNormalCnt + pmCvNomalCnt;
			// 진단 화면 표시 유치 주의 개수
			sheetCautionCnt = babyCvCautionCnt + pmCvCautionCnt;
			// 진단 화면 표시 유치 위험 개수
			sheetdangerCnt = babyCvDangerCnt + pmCvDangerCnt;
	
			// 자녀(피측정자) 이름 등록
			teethMeasureVO.setUserName(userName);
	
			// 유치 정상, 주의, 충치 개수 입력
			teethMeasureVO.setCavityNormal(babyCvNormalCnt);
			teethMeasureVO.setCavityCaution(babyCvCautionCnt);
			teethMeasureVO.setCavityDanger(babyCvDangerCnt);
			// 영구치 정상, 주의, 충치 개수 입력
			teethMeasureVO.setPermCavityNormal(pmCvNomalCnt);
			teethMeasureVO.setPermCavityCaution(pmCvCautionCnt);
			teethMeasureVO.setPermCavityDanger(pmCvDangerCnt);
	
			// 진단 상세 정보 업데이트
			teethService.updateDiagDescript(userId, measureDt, diagDescript);
			// ST_STUDENT_USER_DETAIL 테이블에 CavityCnt 업데이트
			teethService.updateUserCavityCntByMeasureDt(teethMeasureVO);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		hm.put("code", "000");

		hm.put("dataList", teethMeasureVO);
		hm.put("schoolCode", schoolCode);
		hm.put("measureDtList", measureDtList);
		hm.put("cautionLevel", cautionLevel);
		hm.put("dangerLevel", dangerLevel);
		hm.put("cavityNormal", sheetNormalCnt);
		hm.put("cavityCaution", sheetCautionCnt);
		hm.put("cavityDanger", sheetdangerCnt);

		return hm;

	}
	
	
	
	/**
	 * WEB (유치원, 어린이집 조회)
	 * 기능 : 기관장용 - 그래프 조회 - selectbox (파라미터 : 측정일)
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 30
	 */
	@SuppressWarnings("unused")
	@PostMapping(value = { "/web/statistics/director/ajaxGraph"})
	@ResponseBody
	public HashMap<String, Object> directorAjaxGraph(HttpServletRequest request, HttpSession session, Model model, @RequestBody Map<String, String> paramMap) throws Exception {

		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		try {
			
			// 자녀(피측정자) 아이디
			String userId = (String)paramMap.get("userId");
			// 자녀(피측정자) 이름
			String userName = sessionVO.getUserName();
			// 측정일
			String measureDt = (String)paramMap.get("measureDt");
			// 기관코드
			String schoolCode = sessionVO.getSchoolCode();
			// 악화지수 최대 값
			double deteriorateMaxScore = 0;

			TeethMeasureVO webTeethMeasureVO = new TeethMeasureVO();
			List<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
			List<Double> deteriorateScordList = new ArrayList<Double>();
			List<Integer> cavityCntList = new ArrayList<Integer>();
			List<String> userNameList = new ArrayList<String>();
			List<Double> userFearScoreList = new ArrayList<Double>();
			
			dataList = teethService.selectUserMeasureStatisticsList(schoolCode, measureDt);

			for (int i = 0; i < dataList.size(); i++) {
				// 두려움 지수
				double fearScore = 0;
				// 악화지수 초기화
				double deteriorateScore = 0;
				// 자녀(피측정자) 아이디
				String studentUserId = (String) dataList.get(i).get("USER_ID");
				// 자녀(피측정자) 이름
				String studentUserName = (String) dataList.get(i).get("USER_NAME");
				// 자녀(피측정자) 진단 태그 항목
				String diagCd = (String) dataList.get(i).get("DIAG_CD");
				// 자녀(피측정자) 개월 수
				long monthcount = (long) dataList.get(i).get("MONTH_COUNT");

				// 유치 및 영구치 >>  주의(caution) 치아 및 충치(danger) 치아 개수
				int cavityCautionCnt = Integer.parseInt(dataList.get(i).get("CAVITY_CAUTION").toString());
				int cavityDangerCnt = Integer.parseInt(dataList.get(i).get("CAVITY_DANGER").toString());
				int permCavityCautionCnt = Integer.parseInt(dataList.get(i).get("PERM_CAVITY_CAUTION").toString());
				int permCavityDangerCnt = Integer.parseInt(dataList.get(i).get("PERM_CAVITY_DANGER").toString());

				// 악화지수
				deteriorateScore = (double) dataList.get(i).get("DETERIORATE_SCORE");
				// 악화지수 최대값 저장
				if (deteriorateMaxScore < deteriorateScore) {
					deteriorateMaxScore = deteriorateScore;
				}

				//if(selectUserType != null && !selectUserType.equals("")) {
				//stUserName = stUserName + "(" + monthcount + ")";
				//}else {
					// 진단지 조회한 회원과 이름리스트의 이름이 일치하지 않을 경우 = 001~999로 표기
					if (!userName.equals(studentUserName)) {
						studentUserName = String.format("%03d", i + 1) + "(" + monthcount + ")";
					} else {
						studentUserName = studentUserName + "(" + monthcount + ")";
					}
				//}
				
				// 두려움에 대한 처리 (하드코딩)
				if (deteriorateScore > 0 && diagCd.contains("E:001:1")) {
					// 측정 두려움 항목이 있을 경우 *별표 표시
					studentUserName = studentUserName.replaceAll("'", "");
					studentUserName = "\'" + studentUserName + "*\'";
					fearScore = 0;
				} else if (diagCd.contains("E:001:1")) {
					// 측정 두려움 항목만 있을 경우 MAX 값을 지정
					fearScore = Math.round(deteriorateMaxScore);
				}

				if(fearScore % 5 != 0) {
					int calFearScore = (int)fearScore % 5;
					switch(calFearScore) {
					case 1: fearScore = fearScore+4.0;
						break;
					case 2: fearScore = fearScore+3.0;
						break;
					case 3: fearScore = fearScore+2.0;
						break;
					case 4: fearScore = fearScore+1.0;
						break;
					}
				}
				userNameList.add(studentUserName);
				userFearScoreList.add(fearScore);
				cavityCntList.add(cavityDangerCnt + permCavityDangerCnt);
				deteriorateScordList.add(deteriorateScore);
			}
			
			// 자녀(피측정자) 아이디
			hm.put("userId", userId);
			// 자녀(피측정자) 이름
			hm.put("userName", userName);
			// 자녀(피측정자) 소속 기관 코드
			hm.put("schoolCode", schoolCode);
			// 기관 내 측정 인원 수
			hm.put("userCount", dataList.size());
			// 기관 내 측정 인원 이름 목록
			hm.put("userNameList", userNameList);
			// 기관 내 측정 인원 악화 지수 목록
			hm.put("deteriorateScordList", deteriorateScordList);
			// 기관 내 측정 인원 충치 개수 목록
			hm.put("cavityCntList", cavityCntList);
			// 기관 내 측정 두려움 인원 목록
			hm.put("userFearScoreList", userFearScoreList);
			
			hm.put("code", "000");
			hm.put("msg", "success");
			return hm;

		} catch (Exception e) {

			e.printStackTrace();
			hm.put("code", "500");
			hm.put("msg", "Server Error");
			return hm;
			
		}
	}
	
}
