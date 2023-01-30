package com.ilove.coffee.order;

import java.util.List;

public interface OrderService {
	int orderDo(MyOrderVO vo);
	List<MyOrderVO> myorder(String userid);
	int deleteOrder(int orderNo);
	MyOrderVO selectByNo(int orderNo);
}
