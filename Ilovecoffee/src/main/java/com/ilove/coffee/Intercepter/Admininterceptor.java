package com.ilove.coffee.Intercepter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

@Configuration
public class Admininterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("admin 인터셉터 - 1단계 작동");
		HttpSession session = request.getSession();
		String admin_id = (String)session.getAttribute("adminId_session");
		
		System.out.println("admin session 값 : " + admin_id);
		
		String requestUrl = request.getRequestURL().toString();

		System.out.println("url 값 :" + requestUrl);
		
		//하단의 url 체크를 통해, login 페이지는 예외처리를 해줘야 무한 리디렉션에서 벗어날 수 있다
		if(admin_id == null) {
			System.out.println("admin 인터셉터 2단계 작동");
			response.sendRedirect("/admin/login");
			return false;
		}
			
		return true;
	}
}