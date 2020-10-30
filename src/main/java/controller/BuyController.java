package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Buy;
import model.Contents;
import model.Member;
import model.Scoretable;
import service.BuyService;
import service.GameService;
import service.MemberService;
import service.ScoreService;

@Controller
public class BuyController {
	@Autowired
	private MemberService ms;
	@Autowired
	private GameService gs;
	@Autowired
	private BuyService bs;
	@Autowired
	private ScoreService ss;
	
	@RequestMapping("gameBuyList")
	public String gameBuyList(Model model, HttpSession session) {
		return "gameBuyList";
	}
	
	@RequestMapping("gameBuyMsg")
	public String gameBuyMsg(String c_id, Model model, HttpSession session) {
		String m_id = (String) session.getAttribute("id");
		System.out.println("c_id="+c_id);
		int coin = (int) session.getAttribute("ss_coin");
		int c_coin = bs.getC_coin(c_id);//gameService에 구현 c_coin 가지고 오는거 
		Buy buy = new Buy();
		buy.setM_id(m_id);
		buy.setC_id(c_id);
		int useyn = gs.chkUseyn(buy);	//사용가능 여부
		String msg = "";
		int result = 0;	//result = -1(이미구매), 0(코인부족), 1(구매가능)

		if(useyn == 0) {
			if(coin >= c_coin) {
				coin = coin - c_coin;
				Member member = new Member();
				member.setM_id(m_id);
				member.setCoin(coin);
				ms.coinUpdate(member);
				bs.updateUseyn(buy);	//게임 사용여부 1로 업데이트
				ss.scoreInsert(m_id, c_id);	//게임 스코어테이블 insert
				session.setAttribute("ss_coin", coin);
				msg = "구매 완료";
				result = 1;
				model.addAttribute("msg", msg);
				model.addAttribute("result", result);
				return "gameBuyMsg";
			}else{
				msg = "코인이 부족합니다.";
				result = 0;
				model.addAttribute("msg", msg);
				model.addAttribute("result", result);
				return "gameBuyMsg";
			}
		}else{
			msg = "이미 구매한 게임입니다.";
			result = -1;
			model.addAttribute("msg", msg);
			model.addAttribute("result", result);
			return "gameBuyMsg";
		}
	}
	
	@RequestMapping("gameBuyInfo")
	public String gameBuyInfo(String c_id, HttpSession session, Model model) {
		Contents contents = ms.getContents(c_id);
		Scoretable rankOne = ms.scoreRankOne(c_id);	//해당 게임 1등 정보
		
		model.addAttribute("contents", contents);
		model.addAttribute("rankOne", rankOne);
		return "gameBuyInfo";
	}
}
