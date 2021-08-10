package com.it.every.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.it.every.interceptor.LoginInterceptor;


@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new LoginInterceptor())
		//.addPathPatterns("/shop/cart/*", "/shop/order/*","/member/memberEdit","/member/memberOut");
		.excludePathPatterns("/", "/reg/**")
		.addPathPatterns("/professor/**", "/chitchat/**", "/student/**", "/custompage/**", "/junggo/**");
		
		/*
		registry.addInterceptor(new AdminLoginInterceptor())
		.excludePathPatterns("/admin/login/adminLogin") //제외할꺼 이거 안넣으면 계속 삥삥돈다
		.addPathPatterns("/admin/**"); //추가할 내용 **을 통해서 다 넣는다
		*/
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
			= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(2 * 1024 * 1024); // 파일당 업로드 크기 제한 (5MB)
		
		
		return multipartResolver;
	}
	
}
