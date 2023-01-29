package com.ilove.coffee.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	//회원가입
	int insertMember(MemberVO vo);
	//아이디 중복확인
	int idCheck(String userid);
	//비밀번호 선택
	String selectPwd(String userid);
	//아이디로 회원정보조회
	MemberVO selectByUserid(String userid) ;
	//회원 정보 수정
	int updateMember(MemberVO vo);
	//회원 탈퇴
	int deleteMember(String userid);
	//전체회원조회
	List<MemberVO> allMember();
}
