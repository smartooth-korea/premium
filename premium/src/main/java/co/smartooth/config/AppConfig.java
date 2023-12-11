package co.smartooth.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * 작성자 : 정주현 
 * 작성일 : 2022. 4. 28 ~
 */
@Configuration
@Import({ DBConfig.class, MybatisConfig.class })
public class AppConfig {
	
}