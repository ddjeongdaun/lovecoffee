package com.ilove.coffee.adminMember;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ilove.coffee.member.MemberVO;

@Mapper
public interface AdminMemberDAO {
	List<MemberVO> allMember();
	int passwordReset(MemberVO vo);
}
