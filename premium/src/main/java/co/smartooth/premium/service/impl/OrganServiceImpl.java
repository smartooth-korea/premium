package co.smartooth.premium.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.smartooth.premium.mapper.OrganMapper;
import co.smartooth.premium.service.OrganService;
import co.smartooth.premium.vo.OrganVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 * 수정일 : 2023. 11. 20
 */
@Service
public class OrganServiceImpl implements OrganService{
	
	
	@Autowired(required = false)
	OrganMapper organMapper; 
	
	
	
	/** 유치원, 어린이집 **/
	// 유치원, 어린이집 정보 조회
	@Override
	public OrganVO selectSchoolInfo(@Param("schoolCode") String schoolCode) throws Exception {
		return organMapper.selectSchoolInfo(schoolCode);
	}
	
	
	
	// 피측정자 증가에 따른 유치원, 어린이집 회원 시퀀스 증가 
	@Override
	public void updateSchoolUserSeqNo(OrganVO organVO) throws Exception {
		organMapper.updateSchoolUserSeqNo(organVO);
	}
		
	
	
	// 유치원, 어린이집 목록 조회
	@Override
	public List<HashMap<String, Object>> selectSchoolList(@Param("schoolName") String schoolName) throws Exception {
		return organMapper.selectSchoolList(schoolName);
	}

	

	// 유치원, 어린이집 소속 반 목록 조회
	@Override
	public List<HashMap<String, Object>> selectClassList(@Param("schoolCode") String schoolCode) throws Exception {
		return organMapper.selectClassList(schoolCode);
	}
	
	
	
	// 유치원, 어린이집 검색
	@Override
	public List<HashMap<String, Object>> ajaxSelectSchoolList(@Param("searchType") String searchType, @Param("searchData") String searchData) throws Exception {
		return organMapper.ajaxSelectSchoolList(searchType, searchData);
	}

	
	
	// 유치원, 어린이집 치아 측정일 목록 조회 (유치원,어린이집 코드)
	@Override
	public List<HashMap<String, Object>> selectOrganMeasureDtList(@Param("schoolCode") String schoolCode) throws Exception {
		return organMapper.selectOrganMeasureDtList(schoolCode);
	}
	
	
	
	// 유치원, 어린이집 소속 반 이름 조회
	@Override
	public String selectClassName(@Param("userId") String userId) throws Exception {
		return organMapper.selectClassName(userId);
	}



}