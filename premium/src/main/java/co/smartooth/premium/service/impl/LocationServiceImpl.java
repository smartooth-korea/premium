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
	


}