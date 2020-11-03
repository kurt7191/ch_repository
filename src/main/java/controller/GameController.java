package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Buy;
import model.Member;
import model.Scoretable;
import service.GameService;
import service.MemberService;
import service.ScoreService;


@Controller
public class GameController {
	@Autowired
	private MemberService ms;
	@Autowired
	private GameService gs;
	@Autowired
	private ScoreService ss;
	
	// 싱글게임 리스트에서 게임 실행했을때 여러 알고리즘
	@RequestMapping("singleGameMsg")
	public String singleGame(String c_id, HttpSession session, Model model) {
		System.out.println("singleGameMsg c_id:"+c_id);
		String m_id = (String) session.getAttribute("id");
		int heart = (int) session.getAttribute("ss_heart");
		//Member member = ms.getMember(m_id);
		System.out.println("id : "+m_id+", c_id : "+c_id);
		Buy buy = new Buy();
		buy.setM_id(m_id);
		buy.setC_id(c_id);
		String msg = "";
		int result = 0;
		int useyn = gs.chkUseyn(buy);	//사용가능 여부
		System.out.println("사용여부 : "+useyn);
		if(useyn == 1) {
			if(heart > 0) {
				gs.heartUse(m_id);	//하트 소모
				heart = heart - 1;
				session.setAttribute("heart", heart);
				msg = "게임을 시작하겠습니다.";
				result = 1;
				session.setAttribute("ssc_id", c_id);
				model.addAttribute("msg", msg);
				model.addAttribute("result", result);
				return "singleGameMsg";
			}else{
				//하트 모자름
				msg = "하트가 부족합니다.";
				result = 0;
				model.addAttribute("msg", msg);
				model.addAttribute("result", result);
				return "singleGameMsg";
			}
			
		}else{
			//구매 안함
			msg = "게임을 먼저 구매하셔야합니다.";
			result = -1;
			model.addAttribute("msg", msg);
			model.addAttribute("result", result);
			return "singleGameMsg";
		}
	}
	
	//싱글게임 이동
	@RequestMapping("singleGames")
	public String singleGames(HttpSession session) {
		String c_id = (String) session.getAttribute("ssc_id");
		System.out.println(c_id);
		if(c_id.equals("game1")) {
			return "singleGame1";
		}else if(c_id.equals("game2")) {
			return "singleGame2";
		}else{
			return "singleGame3";
		}
	}
	
	//싱글게임1 결과
	@RequestMapping("singleGameResult")
	public String singleGameResult(int time, HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("id");
		String c_id = (String) session.getAttribute("ssc_id");
		System.out.println("c_id="+c_id);
		Scoretable preScore = ss.getScoretable(m_id, c_id);	// 게임 전 스코어 상황
		int highscore = preScore.getHighScore();
		int scoreAve = preScore.getScoreAve();
		int scoreCnt = preScore.getScoreCnt();
		//플레이 횟수 갱신
		scoreCnt = scoreCnt + 1;
		//최고기록 갱신
		if(highscore < time) {
			
		}else {
			highscore = time;
		}
		//평균기록 갱신	
		System.out.println("scoreAve1="+scoreAve);
		scoreAve = (scoreAve*(scoreCnt - 1) + time)/scoreCnt;
		System.out.println("scoreAve2="+scoreAve);
		Scoretable st = new Scoretable();
		st.setM_id(m_id);
		st.setC_id(c_id);
		st.setScore(time);
		st.setHighScore(highscore);
		st.setScoreAve(scoreAve);
		st.setScoreCnt(scoreCnt);
		System.out.println("1");
		ss.singleGameScoreUpdate(st);
		System.out.println("2");
		//아이디 + 게임아이디로 플레이 존재여부 확인
		//int exist = gs.scoreExist(st);
		/*if(exist > 0) {
			//플레이 한적 있음
			//update
		}else{
			//플레이 한적 없음
			//insert
		}*/
		model.addAttribute("scoreCnt", scoreCnt);
		model.addAttribute("highscore", highscore);
		model.addAttribute("scoreAve", scoreAve);
		model.addAttribute("time", time);
		model.addAttribute("c_id", c_id);
		return "singleGameResult";
	}
	
	@RequestMapping("multyGameMsg")
	public String multyGameMsg(String c_id, HttpSession session, Model model) {
		System.out.println("multyGameMsg c_id:"+c_id);
		String m_id = (String) session.getAttribute("id");
		int heart = (int) session.getAttribute("ss_heart");
		//Member member = ms.getMember(m_id);
		System.out.println("id : "+m_id+", c_id : "+c_id);
		Buy buy = new Buy();
		buy.setM_id(m_id);
		buy.setC_id(c_id);
		String msg = "";
		int result = 0;
		int useyn = gs.chkUseyn(buy);	//사용가능 여부
		System.out.println("사용여부 : "+useyn);
		if(useyn == 1) {
			if(heart > 0) {
				gs.heartUse(m_id);	//하트 소모
				heart = heart - 1;
				session.setAttribute("heart", heart);
				msg = "게임을 시작하겠습니다.";
				result = 1;
				session.setAttribute("ssc_id", c_id);
				model.addAttribute("msg", msg);
				model.addAttribute("result", result);
				return "multyGameMsg";
			}else{
				//하트 모자름
				msg = "하트가 부족합니다.";
				result = 0;
				model.addAttribute("msg", msg);
				model.addAttribute("result", result);
				return "multyGameMsg";
			}
			
		}else{
			//구매 안함
			msg = "게임을 먼저 구매하셔야합니다.";
			result = -1;
			model.addAttribute("msg", msg);
			model.addAttribute("result", result);
			return "multyGameMsg";
		}
	}
	
	@RequestMapping("matchWith")
	public String matchWith(HttpSession session, Model model) {
		String c_id = (String) session.getAttribute("ssc_id");
		System.out.println(c_id);
		String m_id = (String)session.getAttribute("id");
		model.addAttribute("m_id", m_id);
		model.addAttribute("c_id", c_id);
		return "matchWith";
	}
	
	@RequestMapping("multyGames")
	public String multyGames(HttpSession session) {
		String c_id = (String) session.getAttribute("ssc_id");
		System.out.println(c_id);
		if(c_id.equals("game4")) {
			return "multyGame1";
		}else if(c_id.equals("game5")) {
			return "multyGame2";
		}else{
			return "multyGame3";
		}
	}
	
}
