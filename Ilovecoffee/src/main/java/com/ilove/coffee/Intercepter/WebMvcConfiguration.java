package com.ilove.coffee.Intercepter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	@Autowired
	Admininterceptor interceptor;

	// Interceptor에서 제외되는 URL 주소
	private static final String[] EXCLUDE_PATHS = {
			"/admin/signup",
			"/admin/login",
			"/admin/loginProc",
			"/admin/join",
			"/api/auth/tokens"
	};

	@Override
	public void addInterceptors (InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.excludePathPatterns(EXCLUDE_PATHS) //인터셉터에 포함되지 않음
		.addPathPatterns("/admin/**") //인터셉터에 포함됨
		;
	}
}