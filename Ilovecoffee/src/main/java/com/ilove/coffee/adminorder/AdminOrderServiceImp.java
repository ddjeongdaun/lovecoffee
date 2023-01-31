package com.ilove.coffee.adminorder;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ilove.coffee.order.MyOrderVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminOrderServiceImp implements AdminOrderService{
	private final AdminOrderDAO dao;

	@Override
	public List<MyOrderVO> allOrder() {
		return dao.allOrder();
	}

	@Override
	public int orderstatusUpdate(int orderNo) {
		return dao.orderstatusUpdate(orderNo);
	}
	
}
