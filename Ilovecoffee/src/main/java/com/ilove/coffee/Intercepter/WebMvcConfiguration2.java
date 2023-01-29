package com.ilove.coffee.Intercepter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfiguration2 implements WebMvcConfigurer {

	@Autowired
	MemberInterceptor interceptor;

	// Interceptor에서 제외되는 URL 주소
	private static final String[] EXCLUDE_PATHS = {
			"/member/login",
			"/member/join",
			"/member/logout",
			"/api/auth/tokens"
	};

	@Override
	public void addInterceptors (InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.excludePathPatterns(EXCLUDE_PATHS) //인터셉터에 포함되지 않음
		.addPathPatterns("/member/**") //인터셉터에 포함됨
		;
	}
}