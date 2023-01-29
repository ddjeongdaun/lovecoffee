package com.ilove.coffee.cart;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private String customerId;
	private int productNo;
	private int quantity;
	private Timestamp regdate;
	
	private String productName;
	private int price;
	private String imageURL;
}
