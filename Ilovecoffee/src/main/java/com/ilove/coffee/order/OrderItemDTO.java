package com.ilove.coffee.order;

import lombok.Data;

@Data
public class OrderItemDTO {
	//주문페이지에서 가져올 값
	private int productNo;
	private int quantity;
	//DB에서 꺼내올 값
	private String productName;
	private int price;
	//총 주문 합계
	private int total;
	
	//총 주문 합계구하기
	public void SaleTotal() {
		this.total=this.quantity*price;
	}

	public OrderItemDTO(int productNo, int quantity, String productName, int price, int total) {
		super();
		this.productNo = productNo;
		this.quantity = quantity;
		this.productName = productName;
		this.price = price;
		this.total = total;
	}
	
}
