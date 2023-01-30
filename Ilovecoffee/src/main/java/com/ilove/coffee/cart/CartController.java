package com.ilove.coffee.cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ilove.coffee.member.MemberServiceImp;
import com.ilove.coffee.member.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class CartController {

	private final CartServiceImp service;
	private final MemberServiceImp memberService;

	@GetMapping("/cart")
	public String cart(HttpSession session, Model model) {
		String userid=(String)session.getAttribute("userid_session");

		List<CartVO> list=service.mycart(userid);
		
		model.addAttribute("userid", userid);
		model.addAttribute("list", list);

		return "/cart/cart";
	}

	@GetMapping("/cart/delete")
	public ModelAndView deleteCart(int productNo, HttpSession session) {
		String userid=(String)session.getAttribute("userid_session");
		ModelAndView mav = new ModelAndView();

		String msg="로그인 후 장바구니 삭제가 가능합니다.",url="/member/login";
		if(userid!=null) {
			int cnt=service.deleteCart(productNo);
			if(cnt>0) {
				msg="장바구니 목록에서 삭제되었습니다.";
				url="/cart";
			}
		}

		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		return mav;
	}

	@GetMapping("/cartIn")
	public ModelAndView cartIn(int productNo, HttpSession session) {
		String userid=(String)session.getAttribute("userid_session");
		ModelAndView mav = new ModelAndView();

		String msg="장바구니 담기 중 에러가 발생하였습니다.";
		String url="/shop";

		if(userid!=null) {
			//장바구니에 있는지 check
			HashMap<String, Object> map = new HashMap<>();
			map.put("customerId", userid);
			map.put("productNo", productNo);
			
			int count=service.checkProduct(map);
			if(count>0) {
				int cnt=service.updateCart(productNo);
				if(cnt>0) {
					msg="장바구니에 담았습니다.";
					url="/shop";
				}
			}else {
				//장바구니에 없을때
				CartVO vo = new CartVO();
				vo.setCustomerId(userid);
				vo.setProductNo(productNo);
				vo.setQuantity(1);
				int cnt1=service.cartIn(vo);
				if(cnt1>0) {
					msg="장바구니에 담았습니다.";
					url="/shop";
				}
			}
		}else {
			msg="장바구니 담기는 회원 로그인 후 가능합니다.";
			url="/member/login";
		}

		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		return mav;
	}
	
	//주문페이지 호출
	@GetMapping("/order")
	public ModelAndView orderPage(HttpSession session) {
		String userid=(String)session.getAttribute("userid_session");
		
		List<CartVO> list=service.mycart(userid);
		MemberVO vo=memberService.selectByUserid(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.addObject("list",list);
		mav.setViewName("/member/orderPage");
		
		return mav;
	}
}
