package com.ilove.coffee.admin;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImp implements AdminService{
	private final AdminDAO adminDao;

	@Override
	public int insertAdmin(AdminVO vo) {
		return adminDao.insertAdmin(vo);
	}

	@Override
	public AdminVO selectById(String userid) {
		return adminDao.selectById(userid);
	}

	@Override
	public int totalProduct() {
		return adminDao.totalProduct();
	}

	@Override
	public int totalMember() {
		return adminDao.totalMember();
	}

	@Override
	public int totalOrder() {
		return adminDao.totalOrder();
	}

	@Override
	public Integer totalOrderPrice() {
		return adminDao.totalOrderPrice();
	}

}
