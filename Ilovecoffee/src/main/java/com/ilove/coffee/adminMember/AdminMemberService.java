package com.ilove.coffee.adminMember;

import java.util.List;

import com.ilove.coffee.member.MemberVO;

public interface AdminMemberService{
	List<MemberVO> allMember();
	int passwordReset(MemberVO vo);
}
