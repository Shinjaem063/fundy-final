package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
*/import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;
import com.kh.fundy.service.MemberService;

@SessionAttributes(value= {"loggedMember"})
@Controller
public class MemberController {

	//log를 찍기위해 logger객체
	private Logger logger=Logger.getLogger(MemberController.class);
	
	
	@Autowired
	private MemberService service;
	
	//암호화
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
	//로그인
	@RequestMapping("/member/memberlogin.do")
	public String memberLogin(Member m, Model model, HttpSession session) {
		
		Member result=service.login(m);
		String msg="";
		String loc="";
		
		System.out.println("로그인 : "+result);
		
		try {
			throw new RuntimeException("경고!");
		}
		catch(RuntimeException e) {
		}

		if(result!=null) {
			if(bcEncoder.matches(m.getMemberPw(), result.getMemberPw())) {
				msg="로그인 성공";
				model.addAttribute("loggedMember", result);
			}
			else {
				msg="password 불일치";
			}
		}
		else {
			msg="ID 존재 X";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	
	//회원가입
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, Model model) {
		//현재시간으로 타임스탬프 
		m.setEnrollDate(new Timestamp(System.currentTimeMillis()));
		//암호화
		m.setMemberPw(bcEncoder.encode(m.getMemberPw()));
		int result=service.insertOne(m);
		String msg="";
		if(result>0) {
			msg="회원가입 완료";
		}
		else {
			msg="회원가입 실패";
		}
		model.addAttribute("msg",msg);
		return "common/msg";
	}
	
	@RequestMapping("/member/memberAddress.do")
	public String memberAddress(ShippingAddr s, Model model) {
		String shipAddrTag = s.getShipAddrTag();
		String shipAddrReceiver = s.getShipAddrReceiver();
		int zipCode = s.getZipCode();
		String shipAddr = s.getShipAddr();
		String shipAddrDatail = s.getShipAddrDetail();
		String phone = s.getPhone();
		
		int result = service.memberAddress(s);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg="배송지가 변경되었습니다.";
			loc="/";
		} else {
			msg="배송지 변경에 오류가 생겼습니다.";
		}
		
		model.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/member/memberAddressView.do")
	public ModelAndView memberAddressView(ShippingAddr s, Model model) {
		ModelAndView mv = new ModelAndView();
		
		List<ShippingAddr> list = service.memberAddressView(s);
		mv.setViewName("memberAddress/memberAddress");
		return mv;
	}
	
	/*@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, Model model) {
		//현재시간으로 타임스탬프 
		m.setEnrollDate(new Timestamp(System.currentTimeMillis()));
		//암호화
		m.setMemberPw(bcEncoder.encode(m.getMemberPw()));
		int result=service.insertOne(m);
		String msg="";
		if(result>0) {
			msg="회원가입 완료";
		}
		else {
			msg="회원가입 실패";
		}
		model.addAttribute("msg",msg);
		return "common/msg";
	}*/
	
	
}
