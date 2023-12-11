package co.smartooth.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 작성자 : 정주현 
 * 작성일 : 2022. 04. 28
 * 수정일 : 2022. 11. 09
 * 기능 : Database 및 mapper 설정
 */
@Configuration
@MapperScan("co.smartooth.premium.mapper")
@EnableTransactionManagement
public class MybatisConfig {

	@Autowired
	ApplicationContext applicationContext;
	
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setConfigLocation(applicationContext.getResource("classpath:mybatis-config.xml"));
		sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml"));
		return sessionFactory.getObject();
	}

	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
		sqlSessionFactory.getConfiguration().setMapUnderscoreToCamelCase(true);
		SqlSessionTemplate sessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
		return sessionTemplate;
	}
}
