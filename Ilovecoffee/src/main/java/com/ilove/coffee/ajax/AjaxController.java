package com.ilove.coffee.ajax;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ilove.coffee.cart.CartServiceImp;
import com.ilove.coffee.member.MemberController;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AjaxController {
	
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	private final CartServiceImp cartService;
	
	@Autowired
	private MemberDao memberDao;
	
	//ajax 테스트용 view
	@RequestMapping("/test")
	public String test() {
		return "/test";
	}
	
	//회원가입 - 아이디 중복확인
	@RequestMapping(value="/idCheck",method=RequestMethod.GET, 
			produces="application/json;charset=utf8")
	public @ResponseBody int memberChk(HttpServletRequest req) {
		JSONObject jsonObject = new JSONObject( );
		
		String userid = req.getParameter("userid");
		logger.info("확인 아이디 : "+userid);
		try {
			jsonObject.put("rowCnt", memberDao.memberChk(userid));
			int cnt=memberDao.memberChk(userid);
			logger.info("결과 : "+cnt);
		} catch (Exception e) {
			e.getMessage( );
		}
		//return jsonObject.toString( );
		
		int result=memberDao.memberChk(userid);
		
		return result;
	}

}
