package com.ilove.coffee.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImp implements CartService{
	
	private final CartDao dao;

	@Override
	public List<CartVO> mycart(String userid) {
		return dao.mycart(userid);
	}

	@Override
	public int cartIn(CartVO vo) {
		return dao.cartIn(vo);
	}

	@Override
	public int updateCart(int productNo) {
		return dao.updateCart(productNo);
	}

	@Override
	public int deleteCart(int productNo) {
		return dao.deleteCart(productNo);
	}

	@Override
	public int checkProduct(HashMap<String, Object> map) {
		return dao.checkProduct(map);
	}

	@Override
	public int modifyCount(CartVO vo) {
		return dao.modifyCount(vo);
	}

	@Override
	public int emptyCart(String customerId) {
		return dao.emptyCart(customerId);
	}
	
}
