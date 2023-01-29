package com.ilove.coffee.product;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductVO {
	private int productNo;
	private int categoryNo;
	private String productName;
	private int price;
	private String explains;
	private Timestamp regdate;
	private String imageURL;
}
