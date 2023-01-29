package com.ilove.coffee.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int no;
	private String userid;
	private String pwd;
	private String name;
	private String email;
	private String hp;
	private String zipcode;
	private String address;
	private String addressDetail;
	private Timestamp regdate;
	
}
