package com.ilove.coffee.adminMember;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilove.coffee.member.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminMemberController {
	
	private final AdminMemberServiceImp service;
	private final PasswordEncoder passwordencoder;
	
	//관리자-회원관리 페이지(전체회원호출)
	@GetMapping("/manageMember")
	public String manageMember(Model model) {
		List<MemberVO> list = service.allMember();
		model.addAttribute("list", list);
		return "/admin/adminMember/manageMember";
	}
	
	//회원비밀번호 초기화
	@GetMapping("/passwordReset")
	public ModelAndView passwordReset(String userid) {
		ModelAndView mav= new ModelAndView();
		
		MemberVO vo=new MemberVO();
		vo.setUserid(userid);
		
		//비밀번호 초기화 및 암호화
		String rawPw="1234";
		String encodPw=passwordencoder.encode(rawPw);
		
		vo.setPwd(encodPw);
		
		int cnt=service.passwordReset(vo);
		
		String msg="회원 비밀번호 초기화 실패!";
		String url="/admin/manageMember";
		if(cnt>0) {
			msg="비밀번호가 초기화 되었습니다.";
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		return mav;
	}
}
