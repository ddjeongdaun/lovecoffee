package com.ilove.coffee.order;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderServiceImp implements OrderService{
	private final OrderDAO dao;
	
	
}
