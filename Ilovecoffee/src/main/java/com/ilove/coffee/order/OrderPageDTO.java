package com.ilove.coffee.order;

import java.util.List;

import lombok.Data;

@Data
public class OrderPageDTO {
	private List<OrderItemDTO> orders;
	
}
