package com.ilove.coffee.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ilove.coffee.order.MyOrderVO;

@Mapper
public interface AdminDAO {
	//어드민 회원가입
	int insertAdmin(AdminVO vo);
	//어드민 회원 아이디로 정보 불러오기
	AdminVO selectById(String userid);
	int totalProduct();
	int totalMember();
	int totalOrder();
	Integer totalOrderPrice();
}
