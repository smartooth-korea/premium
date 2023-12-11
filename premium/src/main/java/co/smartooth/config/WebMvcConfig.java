package co.smartooth.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 * 작성일 : 2022-07-18
 * 작성자 : 정주현
 * 기능 : Resources Path Mapping
 * */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		
		registry.addResourceHandler("/**")
	        .addResourceLocations("classpath:/static/")
	        .setCachePeriod(60*60*24);
		
		
		/** 신규 방식으로 개발할 때 추가한 코드 **/
		registry.addResourceHandler("/user/**")
			.addResourceLocations("classpath:/static/")
			.setCachePeriod(60*60*24);
		
		registry.addResourceHandler("/user/signUp/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);
		/** 신규 방식으로 개발할 때 추가한 코드 **/
		
		
		registry.addResourceHandler("/main/**")
            .addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);

		registry.addResourceHandler("/login/**")
		.addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);
		
		registry.addResourceHandler("/premium/**")
		.addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);
		
		registry.addResourceHandler("/premium/user/**")
		.addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);

		registry.addResourceHandler("/premium/manage/**")
		.addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);

		registry.addResourceHandler("/premium/statistics/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		
		
		/**ADMIN**/
		registry.addResourceHandler("/admin/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/admin/main")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/admin/organ/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/admin/user/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/admin/statistics/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/admin/setting/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/admin/utils/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		
		registry.addResourceHandler("/admin/board/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);
		
		
		/**WEB**/

		registry.addResourceHandler("/**")
        .addResourceLocations("classpath:/static/")
        .setCachePeriod(60*60*24);
	
		registry.addResourceHandler("/main/**")
	        .addResourceLocations("classpath:/static/")
	      .setCachePeriod(60*60*24);
	
		registry.addResourceHandler("/login/**")
		.addResourceLocations("classpath:/static/")
	      .setCachePeriod(60*60*24);

		registry.addResourceHandler("/web/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/web/main/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/web/user/**")
        .addResourceLocations("classpath:/static/")
        .setCachePeriod(60*60*24);

		registry.addResourceHandler("/web/organ/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/web/user/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/web/statistics/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);

		registry.addResourceHandler("/web/statistics/general/**")
		.addResourceLocations("classpath:/static/")
		.setCachePeriod(60*60*24);
		
		registry.addResourceHandler("/admin/school/statistics/**")
		.addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);
		
		

		
		
		registry.addResourceHandler("/test/**")
		.addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);
		
		registry.addResourceHandler("/test/user/**")
		.addResourceLocations("classpath:/static/")
          .setCachePeriod(60*60*24);
	
	}
	
	
}
