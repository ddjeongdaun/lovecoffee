package com.ilove.coffee.adminMember;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ilove.coffee.member.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminMemberServiceImp implements AdminMemberService{
	private final AdminMemberDAO dao;

	@Override
	public List<MemberVO> allMember() {
		return dao.allMember();
	}

	@Override
	public int passwordReset(MemberVO vo) {
		return dao.passwordReset(vo);
	}

}
