package com.ch.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.project.model.Member;
import com.ch.project.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService ls;
	
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8" )
	@ResponseBody // 결과를 jsp 로 보여주지 말고 바로 문장을 전달
	public String idChk(String id) {
		String msg = "";
		Member member = ls.select(id);
		if(member == null) msg = "사용 가능한 아이디 입니다.";
		else msg = "이미 존재하는 아이디 입니다. 다른 아이디를 사용하세요";
		
		return msg;
	}
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinForm";
	}
	@RequestMapping("join")
	public String join(Member member, Model model, HttpSession session) {
		int result = 0;
		System.out.println("email="+member.getEmail());
		Member mem = ls.select(member.getId());
		if(mem == null){
			result = ls.insert(member);
		}else result = -1;
		model.addAttribute("result", result);
		
		return "join";
		
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		return "loginForm";
				
	}
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member mem = ls.select(member.getId());
		if(mem==null || mem.getDel().equals("y")) {
			result = -1; //없는아이디
		}else if(member.getPassword().equals(mem.getPassword())) {
			result = 1;
			session.setAttribute("cId", member.getId());
		}
		model.addAttribute("result", result);
		
		return "login";
	}
	
}
