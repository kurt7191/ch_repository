package com.ch.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Member;
import com.ch.project.model.Pet;
import com.ch.project.service.MypageService;

@Controller
public class mypageController {

	@Autowired
	private MypageService ms;
	
	@RequestMapping("insertPetInfo")
	public String insertPetInfo() {
		return "insertPetInfo";
	}
	@RequestMapping("mypetInfo")
	public String mypetInfo() {
		return "mypetInfo";
		
	}

@RequestMapping("myinfo")
public String myinfo(Model model, HttpSession session) {
	String cId = (String) session.getAttribute("cId");
	Member member = ms.select(cId);
	model.addAttribute("member", member);
	return "myinfo";
}
@RequestMapping("insertPetInfo2")
	public String insertPetInfo2(Model model, Pet pet) {
		int result = 0;
		Pet pet2 = ms.select(pet.getPetNumber());
		if(pet2==null) {
			result = ms.insert(pet);
		}else result = -1;
		model.addAttribute("result", result);
		return "insertPetInfo2";
	}

}
