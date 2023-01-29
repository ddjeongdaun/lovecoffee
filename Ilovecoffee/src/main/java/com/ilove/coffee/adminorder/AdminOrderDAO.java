package com.ilove.coffee.adminorder;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ilove.coffee.order.MyOrderVO;

@Mapper
public interface AdminOrderDAO {
	List<MyOrderVO> allOrder();
}
