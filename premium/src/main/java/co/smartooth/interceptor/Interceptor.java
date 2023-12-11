package co.smartooth.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * 기능 : 전처리기 - interceptor
 * 작성자 : 정주현
 * 작성일 : 2023. 11. 08
 */
public class Interceptor extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		if(logger.isDebugEnabled()){
			logger.debug("===================       START       ===================");
			logger.debug(" Request URI \t:  " + request.getRequestURI());        }
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("===================        END        ===================\n");
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	

}
