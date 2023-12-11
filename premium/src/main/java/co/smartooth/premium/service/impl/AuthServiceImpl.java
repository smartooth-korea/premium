package co.smartooth.premium.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import co.smartooth.premium.mapper.AuthMapper;
import co.smartooth.premium.service.AuthService;
import co.smartooth.premium.vo.AuthVO;

/**
 * 작성자 : 정주현 
 * 작성일 : 2022. 07. 18 ~
 */
@Component
@Service
public class AuthServiceImpl implements AuthService{

	
	@Autowired(required = false)
	AuthMapper authMapper;
	
	
	
	// 아이디와 비밀번호로 존재 여부 확인 :: true = 1, false = 0
	@Override
	public int loginChkByIdPwd(@Param("userId") String userId, @Param("userPwd") String userPwd) throws Exception {
		return authMapper.loginChkByIdPwd(userId, userPwd);
	}

	
	
	// 아이디 존재 여부 확인 :: true = 1, false = 0
	@Override
	public int isIdExist(@Param("userId") String userId) throws Exception {
		return authMapper.isIdExist(userId);
	}

	
	
	// 아이디가 소속 되어있는 유치원, 어린이집 코드와 맞는지 비교
	@Override
	public int loginChkByIdOrganCd(@Param("userId") String userId, @Param("organCd") String organCd) throws Exception {
		return authMapper.loginChkByIdOrganCd(userId, organCd);
	}
	
	
	
}
