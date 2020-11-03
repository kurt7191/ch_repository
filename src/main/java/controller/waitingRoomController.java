package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MemberService;

@Controller
public class waitingRoomController {
	@Autowired
	private MemberService ms;
	
	//대기방
	@RequestMapping("waitRoom")
	public String waitRoom(HttpSession session, Model model) {
		String m_id = (String)session.getAttribute("id");
		model.addAttribute("m_id", m_id);
		return "waitRoom";
	}	
}
