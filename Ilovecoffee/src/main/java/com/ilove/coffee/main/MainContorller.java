package com.ilove.coffee.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainContorller {
	
	@RequestMapping("/")
	public ModelAndView index(HttpSession session) {
		String userid_session=(String)session.getAttribute("userid");
		String name_session=(String)session.getAttribute("name");
		
		ModelAndView mav = new ModelAndView();
		if(userid_session!=null) {
			mav.addObject("userid_session", userid_session);
			mav.addObject("name_session",name_session);
		}
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "/main/about";
	}
	
}
