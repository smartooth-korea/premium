package co.smartooth.premium.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import co.smartooth.premium.vo.AuthVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 */
@Service
public interface LogService {
	
	
	// 로그인 기록 등록
	public void insertUserLoginHistory(AuthVO authVO) throws Exception;
	
	
	// 접속일 업데이트
	public void updateLoginDt(AuthVO authVO) throws Exception;
	
	
	// 로그인 횟수 증가
	public void updateLoginCount(@Param("userId") String userId) throws Exception;
	
	
	
}