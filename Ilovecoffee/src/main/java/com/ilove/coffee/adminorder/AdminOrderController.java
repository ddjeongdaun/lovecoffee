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
}
