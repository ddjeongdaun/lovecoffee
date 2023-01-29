package com.ilove.coffee.cart;

import java.util.HashMap;
import java.util.List;

public interface CartService {
	List<CartVO> mycart(String userid);
	int cartIn(CartVO vo);
	int updateCart(int productNo);
	int deleteCart(int productNo);
	int checkProduct(HashMap<String, Object> map);
	int modifyCount(CartVO vo);
}
