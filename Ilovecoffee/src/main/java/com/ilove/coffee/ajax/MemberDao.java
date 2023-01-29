package com.ilove.coffee.ajax;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
	public int memberChk(String userid);
}
