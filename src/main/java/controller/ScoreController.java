package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Scoretable;
import service.GameService;
import service.MemberService;
import service.ScoreService;

@Controller
public class ScoreController {
	@Autowired
	private MemberService ms;
	@Autowired
	private GameService gs;
	@Autowired
	private ScoreService ss;
	
	@RequestMapping("gameScoreList")
	public String gameBuyList(Model model, HttpSession session) {
		return "gameScoreList";
	}
		
	@RequestMapping("gameScore")
	public String gameScore(String c_id, Model model, HttpSession session) {
		String m_id = (String)session.getAttribute("id");
		List<Scoretable> slist = ss.scoreList(c_id);
		model.addAttribute("slist", slist);
		model.addAttribute("m_id", m_id);
		model.addAttribute("c_id", c_id);
		int rank = 0; //랭킹을 위한 변수
		model.addAttribute("rank", rank);
		return "gameScore";
	}
}
