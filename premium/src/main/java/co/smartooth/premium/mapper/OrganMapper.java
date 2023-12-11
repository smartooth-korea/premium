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
	
	
	/** 유치원, 어린이집 **/
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

	
	// 유치원, 어린이집 반 목록 조회
	// public List<HashMap<String, Object>> selectDepartmentList(@Param("searchType") String searchType, @Param("searchData") String searchData) throws Exception;
		
	
	// 유치원, 어린이집 치아 측정일 목록 조회 (유치원,어린이집 코드)
	public List<HashMap<String, Object>> selectOrganMeasureDtList(@Param("schoolCode") String schoolCode) throws Exception;
	

	// 유치원, 어린이집 소속 반 이름 조회
	public String selectClassName(@Param("userId") String userId) throws Exception;




}