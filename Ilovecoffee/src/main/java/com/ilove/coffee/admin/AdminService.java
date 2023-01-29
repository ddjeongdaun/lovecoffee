package com.ilove.coffee.admin;

import java.util.List;

import com.ilove.coffee.order.MyOrderVO;

public interface AdminService{
	int insertAdmin(AdminVO vo);
	AdminVO selectById(String userid);
	int totalProduct();
	int totalMember();
	int totalOrder();
	Integer totalOrderPrice();
}
