package com.ilove.coffee.product;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImp implements ProductService{
	
	private final ProductDAO productDao;
	
	@Override
	public List<ProductVO> allProduct() {
		return productDao.allProduct();
	}

}
