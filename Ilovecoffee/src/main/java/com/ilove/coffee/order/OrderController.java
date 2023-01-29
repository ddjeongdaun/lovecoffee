package com.ilove.coffee.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilove.coffee.member.MemberServiceImp;
import com.ilove.coffee.member.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class OrderController {
	
	private final OrderServiceImp service;
	private final MemberServiceImp memberservice;
	
	//주문페이지 표시
	@PostMapping("/orderPage")
	public ModelAndView orderPage(HttpSession session, List<OrderItemDTO> list) {
		String userid=(String)session.getAttribute("userid_session");
		ModelAndView mav = new ModelAndView();
		
		if(userid==null) {
			String msg="로그인 후 주문이 가능합니다.", url="/member/login"; 
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			MemberVO vo=memberservice.selectByUserid(userid);
			
			mav.addObject("list", list);
			mav.addObject("vo", vo);
			mav.setViewName("/member/orderPage");
		}
		
		return mav;
	}
	
	//주문처리
	@RequestMapping("/order")
	public ModelAndView order(HttpSession session, OrderItemDTO dto) {
		String userid=(String)session.getAttribute("userid_session");
		ModelAndView mav = new ModelAndView();
		
		if(userid==null) {
			String msg="로그인 후 주문이 가능합니다.", url="/member/login"; 
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}else {
			
		}
		
		return mav;
	}
}
