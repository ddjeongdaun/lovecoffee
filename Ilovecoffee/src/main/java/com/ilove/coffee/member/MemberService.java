package com.ilove.coffee.member;

import java.util.List;

public interface MemberService {
	//로그인 체크에서 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2;  //비번 불일치
	public static final int NONE_USERID=3;  //해당 아이디 없음
	
	//아이디 중복확인
	public int idCheck(String userid);
	//회원가입
	public int insertMember(MemberVO vo);
	//로그인 체크
	public int checkLogin(String userid, String pwd);
	//아이디로 멤버 select
	MemberVO selectByUserid(String userid);
	//회원정보 수정
	int updateMember(MemberVO vo);
	//회원탈퇴
	public int deleteMember(String userid);
	//전체 멤버 조회
	List<MemberVO> allMember();
}
