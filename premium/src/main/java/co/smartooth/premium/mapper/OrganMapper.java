package co.smartooth.premium.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import co.smartooth.premium.vo.OrganVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2022. 11. 08
 * 수정일 : 2023. 12. 07
 */
@Mapper
public interface OrganMapper {
	
	
	/** 치과 서비스 측정 앱 **/
	// 측정 예정 혹은 측정 완료 기관 목록 조회 (SYSDATE 기준)
	public List<HashMap<String, Object>> selectMeasureOrganList(@Param("userId") String userId, @Param("userType") String userType) throws Exception;
	
	
	// 치과 소속 부서 목록 조회 (사실상 치과에 소속된 부서는 1개)
	public List<HashMap<String, Object>> selectDepartmentList(@Param("organCode") String organCode) throws Exception;
	
	
	// 치과 정보 조회
	public HashMap<String, Object> selectDentalHospitalInfo(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception;
	
	
	
	
	
	
	/** 유치원, 어린이집 측정 앱 **/
	// 유치원, 어린이집 목록 전체 조회
	public List<HashMap<String, Object>> selectAllSchoolList() throws Exception;
	
	
	// 측정 예정 혹은 측정 완료 기관 목록 조회 (SYSDATE 기준)
	public List<HashMap<String, Object>> selectMeasureSchoolList(@Param("userId") String userId) throws Exception;
	
	
	// 반 목록 조회
	public List<HashMap<String, Object>> selectTcUserList(@Param("schoolCode") String schoolCode) throws Exception;
	
	
	// 반에 해당하는 피측정자 회원 수 조회 (파라미터 : 반 아이디 = 반 코드)
	public int selectClassUserCount(@Param("classCode") String classCode) throws Exception;
	
	
	
	
	
	
	/** 유치원, 어린이집 조회 앱 **/
	// 유치원, 어린이집 정보 조회
	public OrganVO selectSchoolInfo(@Param("schoolCode") String schoolCode) throws Exception;
	
	
	//  피측정자 증가에 따른 유치원, 어린이집 회원 시퀀스 증가 
	public void updateSchoolUserSeqNo(OrganVO organVO) throws Exception;
	
	
	// 유치원, 어린이집 목록 조회
	public List<HashMap<String, Object>> selectSchoolList(@Param("schoolName") String schoolName) throws Exception;
	
	
	// 유치원, 어린이집 소속 반 목록 조회
	public List<HashMap<String, Object>> selectClassList(@Param("schoolCode") String schoolCode) throws Exception;

	
	// 유치원, 어린이집 검색
	public List<HashMap<String, Object>> ajaxSelectSchoolList(@Param("searchType") String searchType, @Param("searchData") String searchData) throws Exception;

	
	// 유치원, 어린이집 치아 측정일 목록 조회 (유치원,어린이집 코드)
	public List<HashMap<String, Object>> selectOrganMeasureDtList(@Param("schoolCode") String schoolCode) throws Exception;
	

	// 유치원, 어린이집 소속 반 이름 조회
	public String selectClassName(@Param("userId") String userId) throws Exception;


}