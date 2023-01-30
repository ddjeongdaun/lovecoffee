package com.ilove.coffee.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDAO {
	int orderDo(MyOrderVO vo);
	List<MyOrderVO> myorder(String userid);
	int deleteOrder(int orderNo);
	MyOrderVO selectByNo(int orderNo);
}
