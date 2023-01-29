package com.ilove.coffee.adminProduct;

import java.util.List;

import com.ilove.coffee.product.ProductVO;

public interface AdminProductService{
	List<ProductVO> allProduct();
	int insertProduct(ProductVO vo);
}
