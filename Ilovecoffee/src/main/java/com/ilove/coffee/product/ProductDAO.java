package com.ilove.coffee.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductDAO {
	//메뉴리스트 불러오기
	public List<ProductVO> allProduct();
}
