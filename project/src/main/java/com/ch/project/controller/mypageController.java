package com.ch.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.project.model.Member;
import com.ch.project.model.Pet;
import com.ch.project.service.MypageService;

@Controller
public class mypageController {

	@Autowired
	private MypageService ms;

	@RequestMapping(value = "petNumberChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String petNumberChk(int petNumber) {
		String msg = "";
		Pet pet = ms.select(petNumber);
		if(pet == null) {
			msg = "사용 가능한 펫 번호 입니다.";
		} else {
			msg = "이미 존재하는 펫 번호 입니다.";
		}
		return msg;
	}
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
		String[] em = member.getEmail().split(",");
		member.setEmail(em[0]+"@"+em[1]);
		String[] pn = member.getPhoneNumber().split(",");
		member.setPhoneNumber(pn[0]+"-"+pn[1]+"-"+pn[2]);
		model.addAttribute("member", member);
		return "myinfo";
	}

	@RequestMapping("insertPetInfo2")
	public String insertPetInfo2(Model model, Pet pet) {
		int result = 0;
		Pet pet2 = ms.select(pet.getPetNumber());
		if (pet2 == null) {
			result = ms.insert(pet);
		} else
			result = -1;
		model.addAttribute("result", result);
		return "insertPetInfo2";
	}

	@RequestMapping("myinfoUpdateForm")
	public String myinfoUpdateForm(Model model, HttpSession session) {
		String cId = (String) session.getAttribute("cId");
		Member member = ms.select(cId);
		model.addAttribute("member", member);
		return "myinfoUpdateForm";
	}

	@RequestMapping("myinfoUpdate")
	public String myinfoUpdate(Model model, Member member) {
		int result = 0;
		result = ms.update(member);
		model.addAttribute("result", result);
		return "myinfoUpdate";
	}

	
	@RequestMapping("myinfoDelete")
	public String myinfoDelete(Member member, Model model, HttpSession session) {
		System.out.println("대박");
		String cId = (String) session.getAttribute("cId");
		int result = ms.delete(cId);
		if (result > 0) {
			session.invalidate();
		}
		System.out.println("result=" +result);
		model.addAttribute("result", result);
		return "myinfoDelete";
	}

}
