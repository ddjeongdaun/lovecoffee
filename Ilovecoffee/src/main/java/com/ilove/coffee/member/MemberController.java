package com.ilove.coffee.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ilove.coffee.order.MyOrderVO;
import com.ilove.coffee.order.OrderServiceImp;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	private final MemberServiceImp memberservice;
	private final OrderServiceImp orderservice;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	//로그인
	@PostMapping("/login")
	public String login_post(@ModelAttribute MemberVO vo, HttpSession session, Model model){
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
	    String encodePw = "";
		
		//아이디를 통해 멤버 정보 호출
		MemberVO memVo=memberservice.selectByUserid(vo.getUserid());
		
		String msg="잘못된 로그인 정보입니다.";
		String url="/member/login";
		
		if(memVo!=null) {
			rawPw=vo.getPwd();
			encodePw=memVo.getPwd();
			if(passwordEncoder.matches(rawPw, encodePw)==true) {
				memVo.setPwd("");		//비밀번호 일치하니, 보안을 위해 비밀번호 삭제
				session.setAttribute("userid_session", memVo.getUserid());
				session.setAttribute("name_session", memVo.getName());
				
				msg=memVo.getName() + " 님 로그인되었습니다.";
				url="/";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	//회원가입 처리
	@PostMapping("/join")
	public String join_post(@ModelAttribute MemberVO vo, HttpSession session, Model model,
			String sample6_postcode, String sample6_address, String sample6_detailAddress){

		//사용자에게 받은 비밀번호를 인코딩 / set
		String encodPw=passwordEncoder.encode(vo.getPwd());
		vo.setPwd(encodPw);
		
		//다음 우편번호 api 세팅
		vo.setZipcode(sample6_postcode);
		vo.setAddress(sample6_address);
		vo.setAddressDetail(sample6_detailAddress);
		
		int cnt=memberservice.insertMember(vo);
		
		String msg="회원가입 처리 중 문제가 발생하였습니다.", url="/member/join";
		if(cnt>0) {
			msg="회원가입 처리되었습니다.";
			url="/";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("userid_session");
		session.removeAttribute("name_session");
		
		model.addAttribute("msg", "로그아웃되었습니다");
		model.addAttribute("url", "/");
		
		return "/common/message";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	@GetMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage_get(HttpSession session) {
		String userid_session=(String)session.getAttribute("userid_session");
		ModelAndView mav=new ModelAndView();
		
		MemberVO vo=memberservice.selectByUserid(userid_session);
		
		if(vo!=null) {
			//전화번호 처리
			String hp=vo.getHp();
			String tel[] = hp.split("-");
			String hp1=tel[0];
			String hp2=tel[1];
			String hp3=tel[2];
			
			mav.addObject("hp1",hp1);
			mav.addObject("hp2",hp2);
			mav.addObject("hp3",hp3);
			
			//이메일 처리
			String originalEmail=vo.getEmail();
			
			String email[] = originalEmail.split("@");
			
			String email1=email[0];
			String email2=email[1];
			String email3="";
			
			String emailList[] = {"naver.com","daum.net"};
			
			if(!email2.equals(emailList[0]) || !email2.equals(emailList[1])) {
				email3=email2;
			}
			//이메일처리
			mav.addObject("email1",email1);
			mav.addObject("email2",email2);
			mav.addObject("email3",email3);
			
			
			mav.addObject("vo", vo);
			mav.setViewName("/member/mypage");
		}else {
			String msg="로그인 후 접속가능합니다.";
			String url="/member/login";
			mav.addObject("msg", msg);
			mav.addObject("url", url);
			mav.setViewName("/common/message");
		}
		
		return mav;
	}
	
	@PostMapping("/updateMember")
	public ModelAndView updateMember(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		
		//비밀번호 암호화
		String rawPw=vo.getPwd();
		String encodePw=passwordEncoder.encode(rawPw);
		
		vo.setPwd(encodePw);
		
		int cnt=memberservice.updateMember(vo);
		
		String msg="회원정보 수정 중 에러발생!";
		String url="/member/mypage";
		if(cnt>0) {
			msg="회원정보가 수정되었습니다.";
		}
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	@RequestMapping("/myorder")
	public ModelAndView myorder(HttpSession session) {
		String userid=(String)session.getAttribute("userid_session");
		List<MyOrderVO> list=orderservice.myorder(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/member/myorder");
		return mav;
	}
}
