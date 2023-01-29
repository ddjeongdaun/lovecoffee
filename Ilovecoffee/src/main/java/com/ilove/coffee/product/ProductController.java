package com.ilove.coffee.product;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ProductController {
	private static final Logger logger=LoggerFactory.getLogger(ProductController.class);
	
	private final ProductService productService;
	
	@GetMapping("/shop")
	public String shop(Model model) {
		List<ProductVO> list=productService.allProduct();
		
		model.addAttribute("list", list);
		return "/main/shop";
	}
}
