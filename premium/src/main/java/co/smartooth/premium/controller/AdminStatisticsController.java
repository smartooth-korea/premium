package co.smartooth.premium.controller;

import org.json.simple.JSONObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import co.smartooth.premium.vo.OrganVO;
import co.smartooth.premium.vo.TeethMeasureVO;
import co.smartooth.premium.vo.UserVO;


/**
 * 작성자 : 정주현
 * 작성일 : 2023. 11. 14
 */
@Controller
public class AdminStatisticsController {


	
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


	
	
	
	/**
	 * 기능 : 관리자페이지 - 진단 결과지 조회 호출 API (외부용)
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 09
	 * 파라미터 : teethType 은 Milk teeth(M)으로 하드코딩
	 */
	@GetMapping(value = { "/admin/school/statistics/diagnosis.do"})
	public String adminDiagnosis(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		// 자녀(피측정자) 아이디
		String userId = request.getParameter("userId");
		// 측정일
		String measureDt = request.getParameter("measureDt");
		
		if(userId==null || "".equals(userId)){
			// 측정일이 오지 않았을 경우
			model.addAttribute("loginUrl", loginUrl);
			model.addAttribute("msg", "잘못된 요청입니다.\n전달된 아이디가 없습니다.)");
			return "/common/alertMessage";
		}
		if(measureDt==null || "".equals(measureDt)){
			// 측정일이 오지 않았을 경우
			model.addAttribute("loginUrl", loginUrl);
			model.addAttribute("msg", "측정 기록이 없습니다.");
			return "/common/alertMessage";
		}
		
		UserVO userVO = userService.selectUserInfo(userId);
		
		// 유치원, 어린이집 코드
		String schoolCode = request.getParameter("schoolCode");
		// 유치원, 어린이집 정보
		OrganVO organVO = organService.selectSchoolInfo(schoolCode);
		// 유치원, 어린이집 이름
		String schoolName = organVO.getSchoolName();
		// 유치원, 어린이집 소속 반 이름
		String className = organService.selectClassName(userId);
		       
		// 피측정자 이름
		String userName = userVO.getUserName();
		// 피측정자 유형
		String returnUrl = null;
		
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
		// 진단지 에디터에 표시되는 진단 내용 (태그X)
		String tmpDiagDescript = "";
		// 진단 코드 설명 업데이트 여부
		String diagDescriptFl = "";
		// 진단 코드 카운트
		int isDiagCnt = 0;
	
		TeethMeasureVO teethMeasureVO = new TeethMeasureVO();
		
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
			
			// 피측정자 최근 치아 측정 값 조회
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
			
			// 피측정자 진단 코드 조회
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
			
			// 치실이란 단어를 html A태그가 있는걸로 변환
			String dentalFloss = diagnosisService.changeSalesKewordHtmlTag("치실");
			String fluorine = diagnosisService.changeSalesKewordHtmlTag("불소도포");
			
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
						diagDescript += "&nbsp;" + diagnosisService.selectDiagDescript("E003",  "M") + "<br/>";
						diagDescript = diagDescript.replaceAll("			", "");
						teethMeasureVO.setDiagTitle(diagTitle);
						teethMeasureVO.setDiagCd(userDiagCd);
					}
					tmpDiagDescript = diagDescript;
					diagDescript = diagDescript.replaceAll("			", "");
					diagDescript = diagDescript.replaceAll("치실", dentalFloss);
					diagDescript = diagDescript.replaceAll("불소도포", fluorine);
					diagDescript = diagDescript.replaceAll("불소 도포", fluorine);
					teethMeasureVO.setDiagDescript(diagDescript);
				}
			}else {
				diagDescript = teethMeasureVO.getDiagDescript();
				tmpDiagDescript = diagDescript.replaceAll(dentalFloss, "치실");
				tmpDiagDescript = tmpDiagDescript.replaceAll(fluorine, "불소 도포");
				tmpDiagDescript = tmpDiagDescript.replaceAll(fluorine, "불소 도포");
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
	
			// 피측정자 이름 등록
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
			
			returnUrl =  "/web/statistics/school/diagnosis_main_api";
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		model.addAttribute("userId", userId);
		model.addAttribute("dataList", teethMeasureVO);
		model.addAttribute("measureDt", measureDt);
		model.addAttribute("cautionLevel", cautionLevel);
		model.addAttribute("dangerLevel", dangerLevel);
		model.addAttribute("cavityNormal", sheetNormalCnt);
		model.addAttribute("cavityCaution", sheetCautionCnt);
		model.addAttribute("cavityDanger", sheetdangerCnt);
		model.addAttribute("schoolCode", schoolCode);
		model.addAttribute("schoolName", schoolName);
		model.addAttribute("className", className);
		model.addAttribute("tmpDiagDescript", tmpDiagDescript);
		
		return returnUrl; 	   
		
	}
	
	
	
	/**
	 * 기능 : 관리자페이지 - 그래프 조회 호출 API (외부용)
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 09
	 * 수정일 : 2023. 12. 05
	 */
	@GetMapping(value = { "/admin/school/statistics/graph.do" })
	public String adminGraph(HttpServletRequest request, HttpSession session, Model model) {

		// 리턴 URL 주소
		String returnUrl = null;
		// 피측정자 아이디
		String userId = request.getParameter("userId");
		// 측정일
		String measureDt = request.getParameter("measureDt");
		// 유치원(기관) 코드
		String schoolCode = request.getParameter("schoolCode");
		String schoolName = null;

		if(userId==null || "".equals(userId)){
			// 측정일이 오지 않았을 경우
			model.addAttribute("loginUrl", loginUrl);
			model.addAttribute("msg", "잘못된 요청입니다.\n(파라미터(아이디)가 없습니다.)");
			return "/common/alertMessage";
		}
		if(measureDt==null || "".equals(measureDt)){
			// 측정일이 오지 않았을 경우
			model.addAttribute("loginUrl", loginUrl);
			model.addAttribute("msg", "측정 기록이 없습니다.");
			return "/common/alertMessage";
		}
		
		String userName = null; 
		
		try {

			// 회원 정보 조회
			UserVO userVO = userService.selectUserInfo(userId);
			userName = userVO.getUserName();
			// 유치원(기관) 정보 조회
			OrganVO organVO = organService.selectSchoolInfo(schoolCode);
			schoolName = organVO.getSchoolName();
			
			// 악화지수
			double deteriorateMaxScore = 0;
			// 결제 정보에 따라서 보여지는 양을 다르게 조정 :: 기본 값은 3
			int limit = 100;

			TeethMeasureVO teethMeasureVO = new TeethMeasureVO();
			List<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>();
			List<String> measureDtList = new ArrayList<String>();
			List<Double> deteriorateScordList = new ArrayList<Double>();
			List<Integer> cavityCntList = new ArrayList<Integer>();
			List<String> userNameList = new ArrayList<String>();
			List<Double> userFearScoreList = new ArrayList<Double>();

			// 치아 측정 VO
			teethMeasureVO.setUserId(userId);
			teethMeasureVO.setLimit(limit);
			// 피측정자 치아 측정일 목록
			measureDtList = teethService.selectUserMeasureDtList(userId);
			// 최근 측정일
			measureDt = measureDtList.get(0);
			// 기관 내 피측정자 데이터 통계 작업 후 조회
			dataList = teethService.selectUserMeasureStatisticsList(schoolCode, measureDt);
			// 기관명 
			schoolName = (String)dataList.get(0).get("SCHOOL_NAME");
			
			for (int i = 0; i < dataList.size(); i++) {
				// 악화 지수 초기화
				double fearScore = 0;
				// 피측정자 아이디
				String stUserName = (String) dataList.get(i).get("USER_NAME");
				// 피측정자 진단 태그 항목
				String diagCd = (String) dataList.get(i).get("DIAG_CD");
				// 피측정자 개월 수
				long monthcount = (long) dataList.get(i).get("MONTH_COUNT");
				// 피측정자 악화지수
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
			
			
			// 피측정자 아이디
			model.addAttribute("userId", userId);
			// 피측정자 이름
			model.addAttribute("userName", userName);
			// 피측정자 소속 기관 코드
			model.addAttribute("schoolCode", schoolCode);
			// 피측정자 소속 기관 이름
			model.addAttribute("schoolName", schoolName);
			// 기관 내 측정 인원 수
			model.addAttribute("userCount", dataList.size());
			// 치아 측정일 목록
			model.addAttribute("measureDt", measureDt);
			// 기관 내 측정 인원 이름 목록
			model.addAttribute("userNameList", userNameList);
			// 기관 내 측정 인원 악화 지수 목록
			model.addAttribute("deteriorateScordList", deteriorateScordList);
			// 기관 내 측정 인원 충치 개수 목록
			model.addAttribute("cavityCntList", cavityCntList);
			// 기관 내 측정 두려움 인원 목록
			model.addAttribute("userFearScoreList", userFearScoreList);
			
			returnUrl =  "/web/statistics/school/graph_main_api";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return returnUrl;
	}
	
	
	
	/**
	 * 기능   : 관리자페이지 - 진단 결과지 호출 후 진단 내용 업데이트 (외부용)
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 09
	 * 수정일 : 2023. 12. 12
	 */
	@SuppressWarnings("unchecked")
	@PostMapping(value = {"/admin/school/statistics/updateDiagDescript.do"})
	@ResponseBody
	public String AjaxUpdateDiagDescript(@RequestBody HashMap<String, Object> paramMap) throws Exception {
		
		String userId = (String)paramMap.get("userId");
		String measureDt = (String)paramMap.get("measureDt");
		String diagDescript = (String)paramMap.get("diagDescript");
		
		// 치실이란 단어를 html A태그가 있는걸로 변환
		String dentalFloss = diagnosisService.changeSalesKewordHtmlTag("치실");
		String fluorine = diagnosisService.changeSalesKewordHtmlTag("불소도포");
		
		diagDescript = diagDescript.replaceAll("치실", dentalFloss); 
		diagDescript = diagDescript.replaceAll("불소도포", fluorine); 
		diagDescript = diagDescript.replaceAll("불소 도포", fluorine); 
		
		// 진단 내용 수정 후 저장
		teethService.updateDiagDescript(userId, measureDt, diagDescript);
		
		// 진단 내용 수정 여부 업데이트
		teethService.updateDiagDescriptFlag(userId, measureDt);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("success", "success");
		return jsonObject.toJSONString(); 
		
	}
	
	
	
	/**
	 * 기능   : 관리자페이지 - 진단 결과지 호출 후 진단 메모 업데이트 (외부용) 
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 09
	 * 수정일 : 2023. 12. 12
	 */
	@SuppressWarnings("unchecked")
	@PostMapping(value = {"/admin/school/statistics/updateMemo.do"})
	@ResponseBody
	public String AjaxUpdateMemo(@RequestBody HashMap<String, Object> paramMap) throws Exception {
		
		String userId = (String)paramMap.get("userId");
		String measureDt = (String)paramMap.get("measureDt");
		String memo = (String)paramMap.get("memo");
		
		// 메모 저장
		teethService.updateMemo(userId, measureDt, memo);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("success", "success");
		return jsonObject.toJSONString(); 
		
	}
	
	
	
}
