package com.ch.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Member;
import com.ch.project.service.LoginService;

@Controller
public class mainController {

	@Autowired	
	private LoginService ls;
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
	}
	@RequestMapping("mypage")
	public String mypage() {
		return "mypage";
	}
	
	
	
}
