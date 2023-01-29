package com.ilove.coffee.adminProduct;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ilove.coffee.product.ProductVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminProductServiceImp implements AdminProductService{
	private final AdminProductDAO dao;

	@Override
	public List<ProductVO> allProduct() {
		return dao.allProduct();
	}

	@Override
	public int insertProduct(ProductVO vo) {
		return dao.insertProduct(vo);
	}

}
