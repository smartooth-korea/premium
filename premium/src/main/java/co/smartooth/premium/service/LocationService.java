package co.smartooth.premium.service;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import co.smartooth.premium.vo.LocationVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2022. 11. 08
 */
public interface LocationService {
	
	
	// 국가 코드 및 정보 조회
	public LocationVO selectNationalInfo(@Param("isoAlpha2") String isoAlpha2) throws Exception; 
	
	
	
	
	
//	// 지역구 조회
//	public List<AdminLocationVO> selectLocationInfo(@Param("sidoCd") String sidoCd, @Param("sggemdCd") String sggemdCd) throws Exception;
//	
//	
//	// 지역이름으로 지역코드(SGGMD_CD) 조회
//	public AdminLocationVO selectLocationCd(@Param("searchType") String searchType, @Param("searchData") String searchData) throws Exception;
//
//	
//	// 전체 시도 코드, 이름 조회
//	public List<AdminLocationVO> selectSidoInfoList() throws Exception;
//	
//	
//	// 전체 시군구 읍면동 코드, 이름 조회
//	public List<AdminLocationVO> selectSigunguEupmyeondongInfoList(@Param("locationNm") String locationNm, @Param("locationCd") String locationCd) throws Exception;
//	
//	
//	// 각 각 읍면동에 대한 SeqNo 업데이트
//	public void updateOgSeqNo(AdminLocationVO adminLocationVO) throws Exception;
	
	
	
	
	
}
