package com.ilove.coffee.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ilove.coffee.cart.CartServiceImp;
import com.ilove.coffee.cart.CartVO;
import com.ilove.coffee.member.MemberServiceImp;
import com.ilove.coffee.member.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class OrderController {
	
	private final OrderServiceImp service;
	private final MemberServiceImp memberservice;
	private final CartServiceImp cartService;
	
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
	@RequestMapping(value="/doOrder", method = RequestMethod.GET)
	public ModelAndView order(HttpSession session) {
		String userid=(String)session.getAttribute("userid_session");
		
		MemberVO vo=memberservice.selectByUserid(userid);
		
		MyOrderVO order = new MyOrderVO();
		String address=vo.getAddress();
		String addressDetail=vo.getAddressDetail();
		String zipcode=vo.getZipcode();
		
		if(zipcode!=null) {
			order.setZipcode(zipcode);
		}else if(address!=null) {
			order.setAddress(address);
		}else if(addressDetail!=null) {
			order.setAddressDetail(addressDetail);
		}
		
		order.setCustomerId(userid);
		order.setDeliveryStatus(1);
		
		List<CartVO> list=cartService.mycart(userid);
		int total=0;
		for(CartVO cart : list) {
			total+=cart.getPrice();
		}
		
		order.setTotalPrice(total);
		
		int cnt=service.orderDo(order);
		
		String msg="주문 중 에러가 발생하였습니다.";
		String url="/member/cart";
		if(cnt>0) {
			cartService.emptyCart(userid);	//장바구니 비우기
			msg="주문이 완료되었습니다.";
			url="/member/myorder";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("/common/message");
		return mav;
	}
	
	@RequestMapping("/orderDelete")
	public ModelAndView orderDelete(HttpSession session, int orderNo) {
		ModelAndView mav = new ModelAndView();
		
		MyOrderVO vo=service.selectByNo(orderNo);
		int deliveryStatus=vo.getDeliveryStatus();
		
		String msg="주문삭제 중 에러 발생!";
		String url="/member/myorder";
		
		if(deliveryStatus == 1) {
			int cnt=service.deleteOrder(orderNo);
			if(cnt>0) {
				msg="주문 취소 처리 되었습니다.";
			}
		}else {
			msg="해당 주문은 배송/픽업 진행중입니다.";
		}
		
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("/common/message");
		return mav;
	}
}
