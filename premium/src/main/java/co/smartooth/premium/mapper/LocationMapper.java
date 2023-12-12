package co.smartooth.premium.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import co.smartooth.premium.vo.LocationVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 08
 */
@Mapper
public interface LocationMapper {
	
	/** 공통 기능 **/
	// 국가 코드 및 정보 조회
	public LocationVO selectNationalInfo(@Param("isoAlpha2") String isoAlpha2) throws Exception;

	
}