package co.smartooth.premium.service.impl;

import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import co.smartooth.auth.MailAuthInfo;
import co.smartooth.premium.mapper.MailAuthMapper;
import co.smartooth.premium.service.MailAuthService;
import co.smartooth.premium.service.UserService;
import co.smartooth.premium.vo.MailAuthVO;
import co.smartooth.utils.AES256Util;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 10
 */
@Service
@PropertySource(value = { "classpath:application.yml"})
public class MailAuthServiceImpl implements MailAuthService{
	
	
	@Autowired(required = false)
	MailAuthMapper mailAuthMapper;
	
	@Autowired(required = false)
	UserService userService;
	
	
	// 메일 인증번호 생성
	int size;
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}

	// 메일 인증번호 난수 발생
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		while (buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	
	
	/**
	 * 유치원, 어린이집 조회 앱 APP
	 * 기능   : 비밀번호 찾기 - 인증 메일 발송 (비밀번호 재설정 전 이메일 유효성 체크)
	 * 비고   : 인증메일 안의 URL은 등록되어 있는 메일인지 유효성 체크
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 10
	 */
	@Override
	public void sendAuthMail(@Param("userId") String userId) throws Exception{
		
		String authKey = getKey(6);
		String encAuthKey = "";
		String encId = "";
		
		AES256Util aes256Util = new AES256Util(); 
		// 이메일 인증번호 (6자리 난수) 생성
		
		try {
			encAuthKey = aes256Util.aesEncode(authKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Properties prop = System.getProperties();
		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");
		// 이메일 발송을 처리해줄 SMTP서버
		// prop.put("mail.smtp.host", "smtp.gmail.com");
		// prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.host", "smtp.worksmobile.com");
		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");
		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");
		// 프로토콜 관련 예외처리를 위한 TLS 버전 지정		 
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new MailAuthInfo();
		MailAuthInfo mailAuthInfo = new MailAuthInfo();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		// 서버 정보를 application.properties에서 호출하여 사용
		String serverInfo = mailAuthInfo.getServerInfo();
		String senderId = mailAuthInfo.getUsername();
		String sernderName = mailAuthInfo.getSenderName();
		// 메일로 전송할 파라미터 아이디 암호화
		encId = aes256Util.aesEncode(userId);

		try {
			// 메일 인증 키 업데이트
			updateAuthKeyById(userId, authKey, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		// 보내는 날짜 지정
		msg.setSentDate(new Date());
		// 발송자를 지정한다. 발송자의 메일, 발송자명
		msg.setFrom(new InternetAddress(senderId, sernderName));
		// 수신자의 메일을 생성한다.
		InternetAddress to = new InternetAddress(userId);
		// Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
		// Message.RecipientType.TO : 받는 사람 // Message.RecipientType.CC : 참조 // Message.RecipientType.BCC : 숨은 참조
		msg.setRecipient(Message.RecipientType.TO, to);
		// 메일의 제목 지정
		msg.setSubject("비밀번호 재설정 - 회원 인증 메일", "UTF-8");

		/**
		 * 비밀번호 변경 시 이메일 유효성 체크
		 * */
		StringBuffer sb = new StringBuffer();
			sb.append("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>")
			.append("<html xmlns='http://www.w3.org/1999/xhtml'>")
			.append("	<head>")
			.append("		<meta http-equiv='Content-Type' content='text/html charset=utf-8' />")
			.append("		<title>회원 인증 메일 ::: ㈜스마투스코리아</title>")
			.append("	</head>")
			.append("	<tbody style='width: 1024px'>")
			.append("		<tr>")
			.append("			<td height='45' colspan='3' bgcolor='#FFFFFF'></td>")
			.append("		</tr>")
			.append("		<tr>")
			.append("			<td height='25' colspan='2' bgcolor='#FFFFFF' align='center'>")
			.append("				<img src='https://www.smartooth.co/imgs/logo_origin.png' width='200px' alt='smartooth' border='0' style='display:block;'>")
			.append("			</td>")
			.append("		</tr>")
			.append("		<tr>")
			.append("			<td colspan='2' align='center'>")
			.append("			<br/>")
			.append("				<h2 style='margin-top:15px; margin-bottom:10px; margin-left: px; font-size:18px; font-weight:lighter;'>이메일 인증을 계속하시려면 아래의 링크를 클릭해주시기 바랍니다.</h2>")
			.append("				<div style='width: 100%;'>")
			.append("					<div style='width:700px;'>")
			.append("						<div>")
			.append("							<br/>")
			.append("							<a href='http://")
			// API URL 설정 부분 // 아이디와 인증번호를 암호화 한 상태에서 메일을 발송
			.append(serverInfo)
			.append("/auth/emailConfirm.do?userId=")
			.append(encId)
			.append("&authKey=")
			.append(encAuthKey)
			// API URL 설정 부분 ////////////////////////////////////////////////
			.append("' style='font-size: 20px; font-weight:bold;'>이메일 인증</a>")
			.append("						</div>")
			.append("						<p style='line-height: 1.4em; font-weight:bold'></p>")
			.append("						<p style='font-size: 11px; color:#636363'></p>")
			.append("					</div>")
			.append("				</div>")
			.append("				<div style='font-size: 11px; color:#636363; background-color:#F4F4F4; line-height:1.3em; padding:20px 30px; margin-top:25px'>")
			.append("					본 메일은 발신 전용 메일이므로 문의 시 확인이 불가능합니다.")
			.append("					<br/>")
			.append("					기타 궁금한 사항은 웹사이트를 방문하여 주시기 바랍니다 (<a href='http://smartooth.co/about_us' target='_blank'>www.smartooth.co)</a> <br/> 또는 이메일로 연락주시기 바랍니다. <a href='mailto:﻿smartooth@smartooth.co'>smartooth@smartooth.co</a>")
			.append("					<br/>")
			.append("				</div>")
			.append("			</td>")
			.append("		</tr>")
			.append("	</body>")
			.append("</html>");

		// text로만 보내고 싶을 경우 setText를 사용 (msg.setText(sb.toString());)
		// html로 보내고 싶을 경우 setContents 사용
		msg.setContent(sb.toString(), "text/html;charset=utf-8");
		// Transport는 메일을 최종적으로 보내는 클래스로 메일을 전송			
		Transport.send(msg);
	}
	
	
	
	// 사용자 메일 인증 여부 확인
	@Override
	public String isEmailAuthEnabled(@Param("userId") String userId) throws Exception {
		return mailAuthMapper.isEmailAuthEnabled(userId);
	}
	
	
	
	// 인증 메일 클릭 시 인증 상태를 'Y' 로 업데이트
	@Override
	public void updateAuthStatusY(@Param("userId") String userId) throws Exception{
		mailAuthMapper.updateAuthStatusY(userId);
	}

	
	// 인증 메일 클릭 시 인증 상태를 'N' 로 업데이트
	@Override
	public void updateAuthStatusN(@Param("userId") String userId) throws Exception {
		mailAuthMapper.updateAuthStatusN(userId);
	}

	
	
	// 계정 메일 인증 키 업데이트
	@Override
	public void updateAuthKeyById(@Param("userId") String userId, @Param("authKey") String authKey) throws Exception {
		mailAuthMapper.updateAuthKeyById(userId, authKey);
	}
	
	
	
	// 계정 메일 인증 키 업데이트
	@Override
	public void updateAuthKeyById(@Param("userId") String userId, @Param("authKey") String authKey, @Param("authEmail") String authEmail) throws Exception {
		mailAuthMapper.updateAuthKeyById(userId, authKey, authEmail);
	}

	
	
	/**
	 * 유치원, 어린이집 조회 앱 WEB
	 * 기능   : 로그인전 비밀번호 변경 - 메일 인증
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 12. 01
	 */
	@Override
	public void sendAuthMail(@Param("userId") String userId, @Param("email") String email) throws Exception {
		
		// 인증키 생성
		String authKey = getKey(6);
		// 인증키 데이터베이스에 업데이트
		mailAuthMapper.updateAuthKeyById(userId, authKey, email);
		
		Properties prop = System.getProperties();
		// 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.starttls.enable", "true");
		// 이메일 발송을 처리해줄 SMTP서버
		// prop.put("mail.smtp.host", "smtp.gmail.com");
		// prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.host", "smtp.worksmobile.com");
		// SMTP 서버의 인증을 사용한다는 의미
		prop.put("mail.smtp.auth", "true");
		// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		prop.put("mail.smtp.port", "587");
		// 프로토콜 관련 예외처리를 위한 TLS 버전 지정		 
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new MailAuthInfo();
		MailAuthInfo mailAuthInfo = new MailAuthInfo();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		// 서버 정보를 application.properties에서 호출하여 사용
		String senderId = mailAuthInfo.getUsername();
		String sernderName = mailAuthInfo.getSenderName();
		
		// 보내는 날짜 지정
		msg.setSentDate(new Date());
		// 발송자를 지정한다. 발송자의 메일, 발송자명
		msg.setFrom(new InternetAddress(senderId, sernderName));
		// 수신자의 메일을 생성한다.
		InternetAddress to = new InternetAddress(email);
		// Message 클래스의 setRecipient() 메소드를 사용하여 수신자를 설정한다. setRecipient() 메소드로 수신자, 참조,
		// Message.RecipientType.TO : 받는 사람 // Message.RecipientType.CC : 참조 // Message.RecipientType.BCC : 숨은 참조
		msg.setRecipient(Message.RecipientType.TO, to);
		// 메일의 제목 지정
		// msg.setSubject("Email Authentication", "UTF-8");
		msg.setSubject("[스마투스 코리아] 프리미엄 서비스 - 이메일 인증", "UTF-8");

		/**
		 * 이메일 인증 메일
		 * */
		StringBuffer sb = new StringBuffer();
			sb.append("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>")
			.append("<html xmlns='http://www.w3.org/1999/xhtml'>")
			.append("	<head>")
			.append("		<meta http-equiv='Content-Type' content='text/html charset=utf-8' />")
			.append("		<title>이메일 인증 ::: 스마투스 코리아</title>")
//			.append("		<title>Email Authentication ::: Smartooth Korea</title>")
			.append("	</head>")
			.append("	<tbody style='width: 1024px'>")
			.append("		<tr>")
			.append("			<td height='45' colspan='3' bgcolor='#FFFFFF'></td>")
			.append("		</tr>")
			.append("		<tr>")
			.append("			<td height='25' colspan='2' bgcolor='#FFFFFF' align='center'>")
			.append("				<img src='https://www.smartooth.co/img/logo_origin.png' width='200px' alt='smartooth' border='0' style='display:block; width: 150px;'>")
			.append("			</td>")
			.append("		</tr>")
			.append("		<tr>")
			.append("			<td colspan='2' align='center'>")
			.append("			<br/>")
//			.append("				<h2 style='margin-top:15px; margin-bottom:10px; margin-left: px; font-size:18px; font-weight:lighter;'>If you recognize this activity, use the activation code below to authenticate:</h2>")
			.append("				<h2 style='margin-top:15px; margin-bottom:10px; margin-left: px; font-size:13px; font-weight:bold; color:#000000;'>스마투스 코리아의 프리미엄 서비스를 이용 중이신 경우 아래의 인증 코드를 사용하여 본인 인증을 해주시기 바랍니다.</h2>")
			.append("				<div style='width: 100%;'>")
			.append("					<div style='width:700px;'>")
			.append("						<div style='font-size: 20px; font-weight: 900; line-height: 30px;'>")
			.append("						인증번호 : ")
			.append(authKey)
			.append("						</div>")
			.append("						<p style='line-height: 1.4em; font-weight:bold'></p>")
			.append("						<p style='font-size: 11px; color:#636363'></p>")
			.append("					</div>")
			.append("				</div>")
			.append("				<div style='font-size: 11px; color:#636363; background-color:#F4F4F4; line-height:1.3em; padding:20px 30px; margin-top:25px'>")
//			.append("					This e-mail is for outgoing only, so it is not possible to check it when making inquiries by e-mail.")
			.append("					본 메일은 발신 전용 메일이므로 메일 문의 시 확인이 불가합니다.")
			.append("					<br/>")
//			.append("					For other questions, please visit the website (<a href='http://smartooth.co/about_us' target='_blank'>www.smartooth.co)</a> <br/> Or Please contact us by email. <a href='mailto:﻿smartooth@smartooth.co'>smartooth@smartooth.co</a>")
			.append("					기타 문의사항은 홈페이지를 방문해주세요. (<a href='http://smartooth.co/about_us' target='_blank'>www.smartooth.co)</a> <br/> 혹은 이메일로 연락주시기 바랍니다. <a href='mailto:﻿smartooth@smartooth.co'>smartooth@smartooth.co</a>")
			.append("					<br/>")
			.append("				</div>")
			.append("			</td>")
			.append("		</tr>")
			.append("	</body>")
			.append("</html>");

			// text로만 보내고 싶을 경우 setText를 사용 (msg.setText(sb.toString());)
		// html로 보내고 싶을 경우 setContents 사용
		msg.setContent(sb.toString(), "text/html;charset=utf-8");
		// Transport는 메일을 최종적으로 보내는 클래스로 메일을 전송			
		Transport.send(msg);
	}

	
	
	// 메일 인증 키 검증
	@Override
	public int isAuthKeyMatch(@Param("userId") String userId, @Param("authKey") String authKey) throws Exception {
		return mailAuthMapper.isAuthKeyMatch(userId, authKey);
	}
	
		
}
