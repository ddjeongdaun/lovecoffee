package com.ilove.coffee.admin;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminServiceImp adminservice;
	private final PasswordEncoder passwordEncoder;
	
	//어드민 로그인 페이지
	@GetMapping("/login")
	public String adminLogin() {
		return "/admin/login";
	}
	
	//어드민 로그인
	@PostMapping("/loginProc")
	public ModelAndView loginProc(AdminVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 암호화된 비밀번호를 호출하기 위해 생성
		String rawPw = "";
		String encodePw = "";
		
		//아이디가 있는지 확인
		AdminVO adVo=adminservice.selectById(vo.getUserid());

		String msg="로그인 실패!";
		String url="/admin/login";
		
		if(adVo!=null) {	//아이디존재
			//받은 pw값 암호화
			rawPw = vo.getPwd();
		    encodePw = adVo.getPwd();
			if(passwordEncoder.matches(rawPw, encodePw)) {	//비밀번호 일치
				adVo.setPwd("");
				//세션에 저장
				session.setAttribute("adminId_session", adVo.getUserid());
				session.setAttribute("adminName_session", adVo.getName());
				
				msg="관리자로 로그인 되었습니다.";
				url="/admin/main";
			}else {
				msg="비밀번호가 일치하지 않습니다.";
			}
		}else {				//아이디 존재X
			msg="존재하지 않는 아이디입니다.";
		}
		
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		mav.setViewName("/common/message");
		return mav;
	}
	
	//어드민 메인 페이지
	@GetMapping("/main")
	public ModelAndView adminMain(HttpSession session, Model model) {
		ModelAndView mav = new ModelAndView();
		//관리자 세션 읽어오기
		String adminId_session=(String)session.getAttribute("adminId_session");
		String adminName_session=(String)session.getAttribute("adminName_session");
		
		if(adminId_session!=null) {			//관리자일경우
			//홈페이지 정보 전달
			mav.addObject("totalOrder", adminservice.totalOrder());
			mav.addObject("totalProduct", adminservice.totalProduct());
			mav.addObject("totalMember", adminservice.totalMember());
			
			Integer totalOrderPrice=adminservice.totalOrderPrice();
			if(totalOrderPrice==null) {
				totalOrderPrice=0;
			}
			mav.addObject("totalOrderPrice", totalOrderPrice);
			//관리자 정보 전달
			mav.addObject("adminId_session", adminId_session);
			mav.addObject("adminName_session", adminName_session);
			mav.setViewName("/admin/main");
		}else {								//관리자가 아닐경우
			String msg="관리자 페이지입니다.";
			String url="/";
			mav.addObject("url", url);
			mav.addObject("msg", msg);
			mav.setViewName("/common/message");
		}
		
		return mav;
	}
	
	//어드민 회원가입 페이지
	@GetMapping("/signup")
	public String signup() {
		return "/admin/signup";
	}
	
	//어드민 회원가입 처리
	@PostMapping("join")
	public ModelAndView join(AdminVO vo, int code) {
		ModelAndView mav = new ModelAndView();
		
		String msg="회원가입 실패!";
		String url="/admin/signup";
		if(code!=1) {
			msg="관리자 코드가 일치하지않습니다.";
		}else {
			//암호화 및 멤버VO에 set
			String rawPw = vo.getPwd();
		    String encodePw = passwordEncoder.encode(rawPw);
		    vo.setPwd(encodePw);
		    
			int cnt=adminservice.insertAdmin(vo);
			if(cnt>0) {
				msg="회원가입 되었습니다.";
				url="/admin/login";
			}
		}
		
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		mav.setViewName("/common/message");
		
		return mav;
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.removeAttribute("adminId_session");
		session.removeAttribute("adminName_session");
		
		return "admin/login";
	}
}
