package com.ilove.coffee.adminorder;

import java.util.List;

import com.ilove.coffee.order.MyOrderVO;

public interface AdminOrderService {
	List<MyOrderVO> allOrder();
	int orderstatusUpdate(int orderNo);
}
