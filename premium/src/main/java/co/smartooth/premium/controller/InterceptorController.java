package co.smartooth.premium.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import co.smartooth.premium.vo.UserVO;
import lombok.extern.slf4j.Slf4j;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 08
 */
@Slf4j
@Controller
public class InterceptorController {
    
	
	
	/**
	 * Web
	 * 기능 : 개인정보 동의서 화면
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 15
	 */
	@GetMapping(value = {"/web/user/agreement"})
	public String agreement() {
		return "/web/user/agreement";
	}
	
	
	
	/**
	 * WEB
	 * 기능 : 유치원, 어린이집 결과지 로그인 화면 UI 호출
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 17
	 */
	@GetMapping(value = {"/", "/login"})
	public String statisticsLoginForm(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response) {
		
		int serverPort = request.getServerPort();
		
		UserVO sessionVO = (UserVO)session.getAttribute("userInfo");
		if(sessionVO == null) {
			
			if(serverPort == 8094) {
				//return "/web/login/loginForm";
				return "/web/login/schoolLoginForm";
			}else {
				//return "/web/login/loginForm";
				return "/web/login/schoolLoginForm";
			}
			
		}else {
			// return "redirect:/web/statistics/diagnosis.do";
			return "redirect:/web/statistics/general/diagnosis.do";
		}
	}
	
	
	
	/**
	 * WEB
	 * 기능 : 유치원장, 어린이집원장 진단 결과지 웹 로그인 화면
	 * 작성자 : 정주현 
	 * 작성일 : 2023. 11. 15
	 */
	@GetMapping(value = {"/director/login"})
	public String directorLoginForm(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response) {
		
		UserVO sessionVO = (UserVO)session.getAttribute("userInfo");
		if(sessionVO == null) {
			// 기관장용 로그인 페이지
			return "/web/statistics/login/directorLoginForm";
		}else {
			return "redirect:/web/statistics/integrateStatistics.do";
		}
		
	}
	
	
	
	/**
	 * WEB
	 * 기능 : 그래프 호출 - 학교,유치원,어린이집
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 24
	 */
	@GetMapping(value = { "/web/statistics/general/diagnosis" })
	public String webDiagnosis(HttpServletRequest request, HttpSession session) throws Exception {

		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		if (sessionVO == null) {
			return "/web/login/schoolLoginForm";
		}
		return "redirect:/web/statistics/general/diagnosis.do";
		
	}
	
	
	
	/**
	 * WEB
	 * 기능 : 그래프 호출 - 학교,유치원,어린이집
	 * 작성자 : 정주현
	 * 작성일 : 2023. 11. 24
	 */
	@GetMapping(value = { "/web/statistics/general/graph" })
	public String webGraph(HttpServletRequest request, HttpSession session) throws Exception {

		// 세션 값
		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
		if (sessionVO == null) {
			return "/web/login/schoolLoginForm";
		}
		return "redirect:/web/statistics/general/graph.do";
		
	}
	
	
	
//	/**
//	 * WEB
//	 * 기능 : 그래프 호출 - 학교,유치원,어린이집
//	 * 작성자 : 정주현
//	 * 작성일 : 2023. 11. 24
//	 */
//	@GetMapping(value = { "/web/statistics/diagnosis" })
//	public String webDiagnosis(HttpServletRequest request, HttpSession session) throws Exception {
//
//		// 세션 값
//		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
//		if (sessionVO == null) {
//			return "/web/login/loginForm";
//		}
//		return "redirect:/web/statistics/diagnosis.do";
//		
//	}
	
	
	
//	/**
//	 * WEB
//	 * 기능 : 그래프 호출 - 학교,유치원,어린이집
//	 * 작성자 : 정주현
//	 * 작성일 : 2023. 11. 24
//	 */
//	@GetMapping(value = { "/web/statistics/graph" })
//	public String webGraph(HttpServletRequest request, HttpSession session) throws Exception {
//
//		// 세션 값
//		UserVO sessionVO = (UserVO) session.getAttribute("userInfo");
//		if (sessionVO == null) {
//			return "/web/login/loginForm";
//		}
//		return "redirect:/web/statistics/graph.do";
//		
//	}
	
	
	
	
	
}
