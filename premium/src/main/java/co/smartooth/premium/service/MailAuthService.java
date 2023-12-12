package co.smartooth.premium.service;

import org.apache.ibatis.annotations.Param;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 08
 */
public interface MailAuthService {

	
	/** 공통 기능 **/
	// 인증 메일 클릭 시 인증 상태 'Y' 로 업데이트
	public void updateAuthStatusY(@Param("userId") String userId) throws Exception;

	
	// 인증 메일 요청 시 인증 상태 'N' 로 업데이트
	public void updateAuthStatusN(@Param("userId") String userId) throws Exception;
	
	
	// 계정 메일 인증 여부 확인
	public String isEmailAuthEnabled(@Param("userId") String userId) throws Exception;
	

	// 메일 인증 번호 업데이트
	public void updateAuthKeyById(@Param("userId") String userId, @Param("authKey") String authKey) throws Exception;

	
	// 인증 키, 인증 메일 업데이트
	public void updateAuthKeyById(@Param("userId") String userId, @Param("authKey") String authKey, @Param("authEmail") String authEmail) throws Exception;
	
	
	
	
	
	
	/** 유치원, 어린이집 **/
	// 비밀번호 변경 인증 메일 발송 (APP)
	public void sendAuthMail(@Param("userId") String userId) throws Exception;
	
	
	// 비밀번호 변경 인증 메일 발송 (WEB)
	public void sendAuthMail(@Param("userId") String userId, @Param("email") String email) throws Exception;
	
	
	// 메일 인증 키 검증 (WEB)
	public int isAuthKeyMatch(@Param("userId") String userId, @Param("authKey") String authKey) throws Exception;

	
}
