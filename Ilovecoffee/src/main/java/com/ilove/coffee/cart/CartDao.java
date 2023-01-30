package com.ilove.coffee.cart;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartDao {
	//장바구니 목록 불러오기
	List<CartVO> mycart(String userid);
	//장바구니 추가
	int cartIn(CartVO vo);
	//장바구니 추가-중복상품은 개수 늘리기
	int updateCart(int productNo);
	//장바구니에 제품이 있는지 확인
	int checkProduct(HashMap<String, Object> map);
	//장바구니에서 삭제
	int deleteCart(int productNo);
	//장바구니 수량 업데이트
	int modifyCount(CartVO vo);
	int emptyCart(String customerId);
}
