package co.smartooth.premium.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartooth.premium.service.OrganService;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 */
@Controller
public class OrganController {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired(required = false)
	private OrganService organService;
	
	

	/**
	 * 기능   : 유치원, 어린이집 목록 조회
	 * 사용처 : 유치원, 어린이집 개인 조회 앱
	 * 작성자 : 정주현 
	 * 작성일 : 2022. 11. 10
	 * 비고 : 유치원, 어린이집 검색어가 없을 경우 전체 리스트 반환
	 */
	@PostMapping(value = {"/organ/selectSchoolList.do"})
	public @ResponseBody Map<String, Object> selectSchoolList(@RequestBody Map<String, Object> paramMap) throws Exception {
		
		String schoolName = (String)paramMap.get("schoolName");
		
		List<HashMap<String, Object>> schoolList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> hm = new HashMap<String, Object>();
		try {
			// 유치원, 어린이집 목록 전체 조회 (검색어가 없을 경우 전체 리시트 반환)
			schoolList = organService.selectSchoolList(schoolName);
			hm.put("code", "000");
			hm.put("mgs", "유치원, 어린이집 목록 조회 성공");
			hm.put("schoolList", schoolList);
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "유치원, 어린이집 목록 조회에 실패했습니다\n관리자에게 문의해주시기 바랍니다.");
		}
		return hm;
	}
	
	
	
	/**
	 * 기능   : 유치원, 어린이집 소속 반 목록 조회
	 * 사용처 : 유치원, 어린이집 개인 조회 앱
	 * 작성자 : 정주현 
	 * 작성일 : 2022. 11. 10
	 * 비고 : 유치원, 어린이집 검색어가 없을 경우 전체 리스트 반환
	 */
	@PostMapping(value = {"/organ/selectClassList.do"})
	public @ResponseBody Map<String, Object> selectClasslList(@RequestBody Map<String, Object> paramMap) throws Exception {
		
		// 유치원, 어린이집 코드
		String schoolCode = (String)paramMap.get("schoolCode");
		// 반 목록
		List<HashMap<String, Object>> classList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		try {
			// 유치원, 어린이집 목록 전체 조회 (검색어가 없을 경우 전체 리시트 반환)
			classList = organService.selectClassList(schoolCode);
			hm.put("code", "000");
			hm.put("mgs", "해당 유치원, 어린이집 반 목록 조회 성공");
			hm.put("classList", classList);
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "해당 유치원, 어린이집 반 목록 조회에 실패했습니다\n관리자에게 문의해주시기 바랍니다.");
		}
		return hm;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 기능   : 유치원, 어린이집 검색 (로그인 및 유치원, 어린이집 원아 등록 시 사용)
	 * 작성자 : 정주현 
	 * 작성일 : 2022. 11. 10
	 * @throws Exception 
	 */
	@PostMapping(value = {"/organ/ajaxSelectSchoolList.do"})
	public @ResponseBody Map<String, Object> ajaxSelectOrganList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		String schoolName = (String)paramMap.get("value");
		List<HashMap<String, Object>> organList = new ArrayList<HashMap<String, Object>>();
		// 유치원, 어린이집 검색
		organList = organService.selectSchoolList(schoolName);
		paramMap.put("organList", organList);
		
		return paramMap;
	}

	
	
	/**
	 * 기능   : 유치원, 어린이집 반 목록 조회 (파라미터로 넘어온 유치원, 어린이집의 반 목록 - 로그인 및 유치원, 어린이집 원아 등록 시 사용)
	 * 작성자 : 정주현 
	 * 작성일 : 2022. 11. 10
	 * @throws Exception 
	 */
	@PostMapping(value = {"/organ/ajaxSelectDepartmentList.do"})
	public @ResponseBody Map<String, Object> ajaxSelectDepartmentList(@RequestParam Map<String, Object> paramMap) throws Exception {
		
		String schoolCode = (String)paramMap.get("schoolCode");
		List<HashMap<String,Object>> departList = new ArrayList<HashMap<String,Object>>();
		// 유치원, 어린이집 반 목록 조회
		departList = organService.selectClassList(schoolCode);
		paramMap.put("departList", departList);
		
		return paramMap;
	}



}
