package co.smartooth.premium.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.smartooth.premium.mapper.LogMapper;
import co.smartooth.premium.service.LogService;
import co.smartooth.premium.vo.AuthVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 */
@Service
public class LogServiceImpl implements LogService{

	
	@Autowired(required = false)
	LogMapper logMapper;
	
	
	
	// 회원 로그인 기록 INSERT
	@Override
	public void insertUserLoginHistory(AuthVO authVO) throws Exception {
		logMapper.insertUserLoginHistory(authVO);
	}
	
	
	
	// 회원 접속일 UPDATE
	@Override
	public void updateLoginDt(AuthVO authVO) throws Exception {
		logMapper.updateLoginDt(authVO);
	}



	@Override
	public void updateLoginCount(@Param("userId") String userId) throws Exception {
		logMapper.updateLoginCount(userId);
	}
	
	
	
}
