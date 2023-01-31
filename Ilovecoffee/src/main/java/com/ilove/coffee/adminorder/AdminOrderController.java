package com.ilove.coffee.adminorder;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilove.coffee.order.MyOrderVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminOrderController {
	private final AdminOrderServiceImp service;
	
	@GetMapping("/manageOrder")
	public String manageOrder(Model model) {
		List<MyOrderVO> list =service.allOrder();
		model.addAttribute("list", list);
		return "/admin/adminOrder/manageOrder";
	}
	
	@GetMapping("/orderstatusUpdate")
	public ModelAndView orderstatusUpdate(int orderNo) {
		ModelAndView mav = new ModelAndView();
		
		int cnt=service.orderstatusUpdate(orderNo);
		
		String msg="주문 완료 처리 중 에러가 발생하였습니다.",
				url="/admin/manageOrder";
		if(cnt>0) {
			msg=orderNo+"번 주문을 주문완료 처리하였습니다.";
		}
		
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("/common/message");
		return mav;
	}
}
