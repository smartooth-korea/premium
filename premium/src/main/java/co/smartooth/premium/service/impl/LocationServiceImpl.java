package co.smartooth.premium.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.smartooth.premium.mapper.LocationMapper;
import co.smartooth.premium.service.LocationService;
import co.smartooth.premium.vo.LocationVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 08
 */
@Service
public class LocationServiceImpl implements LocationService{
	
	
	@Autowired(required = false)
	LocationMapper locationMapper;
	
	
	
	// 국가 코드 및 정보 조회
	@Override
	public LocationVO selectNationalInfo(@Param("isoAlpha2") String isoAlpha2) throws Exception {
		return locationMapper.selectNationalInfo(isoAlpha2);
	} 
	
//	// 지역구 조회
//	@Override
//	public List<AdminLocationVO> selectLocationInfo(@Param("sidoCd") String sidoCd, @Param("sggemdCd") String sggemdCd) throws Exception {
//		return adminLocationMapper.selectLocationInfo(sidoCd, sggemdCd);
//	}
//
//	// 지역이름으로 지역코드(SGGMD_CD) 조회
//	@Override
//	public AdminLocationVO selectLocationCd(@Param("searchType") String searchType, @Param("searchData") String searchData) throws Exception {
//		return adminLocationMapper.selectLocationCd(searchType, searchData);
//	}
//
//	// 전체 시도 코드, 이름 조회
//	@Override
//	public List<AdminLocationVO> selectSidoInfoList() throws Exception {
//		return adminLocationMapper.selectSidoInfoList();
//	}
//
//	// 전체 시군구 읍면동 코드, 이름 조회
//	@Override
//	public List<AdminLocationVO> selectSigunguEupmyeondongInfoList(@Param("locationType") String locationType, @Param("locationCd") String locationCd) throws Exception {
//		return adminLocationMapper.selectSigunguEupmyeondongInfoList(locationType, locationCd);
//	}
//
//	// 각 각 읍면동에 대한 SeqNo 업데이트
//	@Override
//	public void updateOgSeqNo(AdminLocationVO adminLocationVO) throws Exception{
//		adminLocationMapper.updateOgSeqNo(adminLocationVO);
//	}


}