package com.ilove.coffee.adminProduct;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ilove.coffee.product.ProductVO;

@Mapper
public interface AdminProductDAO {
	List<ProductVO> allProduct();
	int insertProduct(ProductVO vo);
}
