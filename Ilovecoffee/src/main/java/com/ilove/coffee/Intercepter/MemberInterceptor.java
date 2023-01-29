package com.ilove.coffee.Intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

@Configuration
public class MemberInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("member 인터셉터 1단계 작동");
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("userid_session");
		
		System.out.println("member_id session 값 : "+member_id);
		
		String requestURL = request.getRequestURI().toString();
		
		System.out.println("url 값 : "+requestURL);
		
		//url 체크, 비로그인 시 login페이지로 
		if(member_id == null) {
			System.out.println("member 인터셉터 2단계 작동");
			response.sendRedirect("/member/login");
			return false;
		}
		
		return true;
	}

}
