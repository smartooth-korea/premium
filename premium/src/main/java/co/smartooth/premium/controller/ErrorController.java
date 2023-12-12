package co.smartooth.premium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import lombok.extern.slf4j.Slf4j;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 12. 12
 */
@Slf4j
@Controller
public class ErrorController {
    
	
	/**
	 * ERROR
	 * 기능 : 개인정보 동의서 화면
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 15
	 */
	@GetMapping(value = {"/error/{statusCode}"})
	public String getErrorPage(@PathVariable String statusCode) {
		return "/common/status/"+statusCode;
	}
	
}
