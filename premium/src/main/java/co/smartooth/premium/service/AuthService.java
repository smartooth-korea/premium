package co.smartooth.premium.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 08
 */
@Service
public interface AuthService {


	/** 공통 기능 **/
	//  아이디와 비밀번호로 존재 여부 확인 :: true = 1, false = 0
	public int loginChkByIdPwd(@Param("userId") String userId, @Param("userPwd") String userPwd) throws Exception;
	
	
	// 아이디 존재 여부 확인 :: true = 1, false = 0
	public int isIdExist(@Param("userId") String userId) throws Exception;
	
	
	
	
	
	
	/** 유치원, 어린이집 **/
	// 아이디가 소속 되어있는 유치원, 어린이집 코드와 맞는지 비교
	public int loginChkByIdOrganCd(@Param("userId") String userId, @Param("organCd") String organCd) throws Exception;
	

}