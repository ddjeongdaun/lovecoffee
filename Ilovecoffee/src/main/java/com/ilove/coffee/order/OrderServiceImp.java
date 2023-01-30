package com.ilove.coffee.order;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderServiceImp implements OrderService{
	private final OrderDAO dao;

	@Override
	public int orderDo(MyOrderVO vo) {
		return dao.orderDo(vo);
	}

	@Override
	public List<MyOrderVO> myorder(String userid) {
		return dao.myorder(userid);
	}

	@Override
	public int deleteOrder(int orderNo) {
		return dao.deleteOrder(orderNo);
	}

	@Override
	public MyOrderVO selectByNo(int orderNo) {
		return dao.selectByNo(orderNo);
	}
	
}
