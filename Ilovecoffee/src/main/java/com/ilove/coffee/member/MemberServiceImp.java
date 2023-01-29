package com.ilove.coffee.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImp implements MemberService{
	
	private final MemberDAO memberDao;
	
	@Autowired
    PasswordEncoder passwordEncoder;
    
    @Transactional
    public void encryptPassword(String pwd){
        MemberVO vo = new MemberVO();
        String enPw = passwordEncoder.encode(pwd);
        vo.setPwd(enPw);
    }
	
	public int insertMember(MemberVO vo){
		int cnt=memberDao.insertMember(vo);
		return cnt;
	}
	
	public int checkLogin(String userid, String pwd) {
		String dbPwd = memberDao.selectPwd(userid);
		
		int result=0;
		if(dbPwd !=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=MemberService.LOGIN_OK;
			}else {
				result=MemberService.DISAGREE_PWD;
			}
		}else {
			result=MemberService.NONE_USERID;
		}
		
		return result;
	}
		
	public int deleteMember(String userid) {
		return memberDao.deleteMember(userid);
	}

	@Override
	public MemberVO selectByUserid(String userid) {
		return memberDao.selectByUserid(userid);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}

	@Override
	public List<MemberVO> allMember() {
		return memberDao.allMember();
	}

	@Override
	public int idCheck(String userid) {
		return memberDao.idCheck(userid);
	}
}
