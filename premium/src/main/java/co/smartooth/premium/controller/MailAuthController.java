package co.smartooth.premium.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.smartooth.premium.service.MailAuthService;
import co.smartooth.premium.service.UserService;
import co.smartooth.utils.AES256Util;

/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 10
 */
@Controller
public class MailAuthController {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Autowired(required = false)
	private MailAuthService mailAuthService;
	
	@Autowired(required = false)
	private UserService userService;

	
	
	/**
	 * 유치원, 어린이집 조회 앱 APP 
	 * 기능   : 인증 확인 - 인증 상태 업데이트
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 10
	 */
	@GetMapping(value = {"/auth/emailConfirm.do"})
	public String emailConfirm(@RequestParam Map<String, String> paramMap) throws Exception {

		// userId(email), authKey 가 일치할경우 authStatus 업데이트
		HashMap<String,Object> hm = new HashMap<String,Object>();
		String userId = paramMap.get("userId");
		String authKey = paramMap.get("authKey");
		String decId = "";
		String decAuthKey = "";
		
		// 아이디와 인증번호 복호화
		AES256Util aes256Util = new AES256Util();
		decAuthKey = aes256Util.aesDecode(authKey);
		decId = aes256Util.aesDecode(userId);
		
		if(decAuthKey.contains("false")) {
			return "/common/status/403";
		}
		// 인증 메일 상태 'Y'로 변경
		mailAuthService.updateAuthStatusY(decId);

		// authSatus의 상태를 JSON으로 return
		hm.put("msg", "메일 인증 성공");
		return "/common/status/200";

	}
	
	
	
	/**
	 * 유치원, 어린이집 조회 앱 APP
	 * 기능   : 앱에서 메일 인증 여부 확인
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 10
	 */
	@PostMapping(value = {"/auth/emailAuthChk.do"})
	@ResponseBody
	public HashMap<String,Object> emailAuthChk(@RequestBody Map<String, String> paramMap) throws Exception {

		HashMap<String,Object> hm = new HashMap<String,Object>();
		String userId = paramMap.get("userId");
		
		if(userId == null || userId.equals("")) {
			hm.put("code", "401");
			hm.put("msg", "아이디가 전달되지 않았습니다.");
			return hm;
		}

		// 계정 메일 인증 여부 확인
		String authStatusYn = mailAuthService.isEmailAuthEnabled(userId);

		if(authStatusYn != null && !authStatusYn.equals("")) {
			if(authStatusYn.equals("Y")) {
				// Y일 경우 인증 성공
				hm.put("code", "000");
				hm.put("msg", "메일 인증 성공");
			}else {  
				// N일 경우 인증 실패
				hm.put("code", "500");
				hm.put("msg", "메일 인증 실패");
			}
		}else {
			hm.put("code", "405");
			hm.put("msg", "인증을 요청하지 않은 아이디 또는 존재하지 않는 아이디입니다.");
		}
		return hm;
	}
	
	
	
	
	
	
	
	
	
	/**
	 * 유치원 어린이집 조회 웹 WEB
	 * 기능   : 인증 메일 발송
	 * 작성자 : 정주현 
	 * 작성일 : 2022. 04. 27
	 * 수정일 : 2023. 08. 03
	 */
	@PostMapping(value = {"/web/auth/emailAuth.do"})
	@ResponseBody
	public HashMap<String,Object> mailAuth(HttpSession session, @RequestBody HashMap<String, String> paramMap) {

		// Parameter :: userId
		String userId = (String)session.getAttribute("userId");
		String authEmail = (String)paramMap.get("email");

		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		try {
			// 인증 메일 요청한 아이디와 메일 주소
			mailAuthService.sendAuthMail(userId, authEmail);
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "메일이 전송되지 않았습니다.\n관리자에게 문의해주시기 바랍니다.");
			e.printStackTrace();
			return hm;
		}
		hm.put("code", "000");
		hm.put("msg", "메일 전송");

		return hm;
	}
	
	
	
	/**
	 * 기능   : 메일 인증 번호 검증
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 12. 01
	 */
	@PostMapping(value = {"/web/auth/isAuthKeyMatch.do"})
	@ResponseBody
	public HashMap<String,Object> isAuthKeyMatch(HttpSession session, @RequestBody HashMap<String, String> paramMap) {
		
 		String userId = (String)session.getAttribute("userId");
		String authKey = paramMap.get("authKey");
		// 인증번호 검증
		int isAuthKeyMatch = 0;
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		try {
			// 메일 인증 번호 확인
			isAuthKeyMatch = mailAuthService.isAuthKeyMatch(userId, authKey);
			// 메일 인증 번호 일치
			if(isAuthKeyMatch > 0 ) {
				// 인증 여부 N -> Y
				mailAuthService.updateAuthStatusY(userId);
				hm.put("code", "000");
				hm.put("msg", "메일 인증 성공");
			}else {
				hm.put("code", "400");
 				hm.put("msg", "메일 인증 실패");
			}
			
		} catch (Exception e) {
			hm.put("code", "500");
			hm.put("msg", "메일 인증 시 문제가 발생하였습니다.\n관리자에게 문의해주시기 바랍니다.");
			e.printStackTrace();
			return hm;
		}
		return hm;
	}
	
}
