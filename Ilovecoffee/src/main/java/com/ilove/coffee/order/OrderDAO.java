package com.ilove.coffee.order;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDAO {
	int orderDo(MyOrderVO vo);
}
