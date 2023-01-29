package com.ilove.coffee.order;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyOrderVO {
	private int orderNo;
	private String customerId;
	private int totalPrice;
	private String deliveryStatus;
	private String zipcode;
	private String address;
	private String addressDetail;
	private Timestamp regdate;
}
