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
	
	
	
	/** 치과 서비스 측정 앱 **/
	// 등록 되어 있는 측정 예정 혹은 측정 완료 기관 목록 조회 (SYSDATE 기준)
	@Override
	public List<HashMap<String, Object>> selectMeasureOrganList(@Param("userId")  String userId, @Param("userType")  String userType) throws Exception {
		return organMapper.selectMeasureOrganList(userId, userType);
	}
	
	
	
	// 치과 소속 부서 목록 조회 (사실상 치과에 소속된 부서는 1개)
	@Override
	public List<HashMap<String, Object>> selectDepartmentList(@Param("organCode") String organCode) throws Exception {
		return organMapper.selectDepartmentList(organCode);
	}
	
	
	
	// 치과 정보 조회
	@Override
	public HashMap<String, Object> selectDentalHospitalInfo(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception{
		return organMapper.selectDentalHospitalInfo(dentalHospitalCd);
	}
	
	
	
	
	
	
	
	
	
	/** 유치원, 어린이집 서비스 측정 앱 **/
	// 유치원, 어린이집 목록 전체 조회
	@Override
	public List<HashMap<String, Object>> selectAllSchoolList() throws Exception {
		return organMapper.selectAllSchoolList();
	}



	// 측정 예정 혹은 측정 완료 기관 목록 조회 (SYSDATE 기준)
	@Override
	public List<HashMap<String, Object>> selectMeasureSchoolList(@Param("userId")  String userId) throws Exception {
		return organMapper.selectMeasureSchoolList(userId);
	}
	
	
	
	// 반 목록 조회
	@Override
	public List<HashMap<String, Object>> selectTcUserList(@Param("schoolCode") String schoolCode) throws Exception{
		return organMapper.selectTcUserList(schoolCode);
	}
	
	
	
	// 반에 해당하는 피측정자 회원 수 조회 (파라미터 : 반 아이디 = 반 코드)
	@Override
	public int selectClassUserCount(@Param("classCode") String classCode) throws Exception {
		return organMapper.selectClassUserCount(classCode);
	}

	
	
	
	
	
	
	
	
	/** 유치원, 어린이집 서비스 조회 앱 **/
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