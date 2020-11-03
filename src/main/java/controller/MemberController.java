package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Stream;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Buy;
import model.Contents;
import model.MemConSco;
import model.Member;
import model.Scoretable;
import service.GameService;
import service.MemberService;
import service.ScoreService;
import utils.LoginManager;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private GameService gs;
	@Autowired
	private ScoreService ss;
	
	@Autowired
	private JavaMailSender jMailSender;
	@Autowired
	private LoginManager loginManager;
	
	int usercount;

	@RequestMapping("start")
	public String start(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		// 접속자 수
		usercount = loginManager.getUserCount();
        session.setAttribute("usercount", usercount);
		return "start";
	}
	
	@RequestMapping("enter")
	public String enter(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		// 접속자 수
		usercount = loginManager.getUserCount();
        session.setAttribute("usercount", usercount);
        // 접속자 리스트
        List<String> listId = new ArrayList<String>();
        Collection<String> collection = loginManager.getUsers();
        System.out.println(collection);
        collection.stream().forEach(s -> {
        	listId.add(s);
        });
 
        // 뿌려봄
        for(int i=0; i<listId.size(); i++) {
        	System.out.println(listId.get(i));

        }
        // 접속자 아이디 리스트를 넣어서 넘김
        List<Member> list = ms.memberList(listId);
        model.addAttribute("list", list);
        //model.addAttribute("collection", collection);
        
		return "main";
	}
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinForm";
	}
	
	//아이디 확인
	@RequestMapping("confirm")
	public String confirm(String m_id, Model model) {
		Member member = ms.confirmId(m_id);
		if(member != null) {	// 실패
			model.addAttribute("m_id", m_id);
			model.addAttribute("result", 1);
		}else{	//성공
			model.addAttribute("m_id", m_id);
			model.addAttribute("result", 0);
		}
		return "confirm";
	}
	
	@RequestMapping("join")
	public String join(Member member, Model model) {
		int result = ms.createMember(member);
		String m_id = member.getM_id();
		//각 게임 사용여부 입력
		ms.insertUseyn(m_id);
		
		/*Buy buy = new Buy();
		buy.setC_id("game1");
		buy.setM_id(member.getM_id());
		buy.setUseyn(1);
		ms.insertUseyn(buy);
		
		buy.setC_id("game2");
		buy.setM_id(member.getM_id());
		buy.setUseyn(0);
		ms.insertUseyn(buy);
		
		buy.setC_id("game3");
		buy.setM_id(member.getM_id());
		buy.setUseyn(0);
		ms.insertUseyn(buy);*/
		// 가입성공 여부 result받긴 했는데 일단 안씀
		return "main";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	//로그인
	@RequestMapping("login")
	public String login(String m_id, String password, Model model, HttpSession session) {
		loginManager.printloginUsers();	// 현재 접속중인 모든 유저의 아이디
		Member member = ms.loginChk(m_id);
		int result;
		if(member != null) {
			if(member.getPassword().equals(password)) {
				session.setAttribute("id", member.getM_id());
				session.setAttribute("ss_coin", member.getCoin());
				session.setAttribute("ss_heart", member.getHeart());
				model.addAttribute("m_id", m_id);
				loginManager.printloginUsers();
				if(loginManager.isUsing(m_id)){
					result = 2;
				}else{
					loginManager.setSession(session, m_id);	//로그인 시 session과 m_id로 로그인매니저에 저장
					result = 1;
				}
			}else{
				result = 0;
			}
		}else{
			result = -1;
		}	
		model.addAttribute("result", result);
		System.out.println("Result = "+result);
		return "login";
	}
	
	@RequestMapping("findIdForm")
	public String findIdForm() {	
		return "findIdForm";
	}
	
	@RequestMapping("findId")
	public String findId(String name, String birthday, Model model) {
		//dao에서 map으로 넣어보고 암호찾기는 member형식으로 넣어보자
		Member member = ms.findId(name, birthday);
		if(member != null) {
			model.addAttribute("m_id", member.getM_id());
			return "findId";
		}else{
			model.addAttribute("name", name);
			model.addAttribute("birthday", birthday);
			return "findId";
		}
	}
	
	@RequestMapping("findPwForm")
	public String findPwForm() {
		return "findPwForm";
	}
	
	//이메일 전송
	@RequestMapping("findPw")
	public String findPw(Member member, Model model) {
		MimeMessage mms = jMailSender.createMimeMessage();
		int result;
		Member mem = ms.findPw(member.getM_id());
		if(mem != null) {
			if(mem.getQuestion().equals(member.getQuestion())) {
				//암호 이메일 전송
				try{
					MimeMessageHelper messageHelper = new MimeMessageHelper(mms,true,"utf-8");
					messageHelper.setSubject("암호 찾기 결과입니다.");
					messageHelper.setText("암호는 : "+mem.getPassword());
					messageHelper.setFrom("jaehoonia@naver.com");
					messageHelper.setTo(mem.getEmail());
					jMailSender.send(mms);
					model.addAttribute("msg","입력하신 이메일로 발송");
				}catch(Exception e){
					System.out.println(e.getMessage());
					model.addAttribute("msg","메일 보내기 실패"); 
				}
				result = 1;
			}else{
				//질문이 다릅니다.
				model.addAttribute("msg","질문에 대한 답변이 다릅니다.");
				result = 0;
			}
		}else{
			//아이디가 없습니다.
			model.addAttribute("msg","입력하신 아이디가 없습니다.");
			result = -1;
		}		
		model.addAttribute("m_id", member.getM_id());
		model.addAttribute("result", result);
		return "findPw";
	}
	
	@RequestMapping("disconnect")
	public String disconnect(HttpSession session) {
		String m_id = (String)session.getAttribute("id");
		System.out.println(m_id);
		if(m_id != null){
	        //기존의 접속(세션)을 끊는다.
	        loginManager.removeSession(m_id);       
	        //새로운 세션을 등록한다. setSession함수를 수행하면 valueBound()함수가 호출된다.
	        loginManager.setSession(session, m_id);
	    }
		return "main";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:enter.do";
	}
	
	@RequestMapping("myInfoUpdateForm")
	public String myInfoUpdateForm(HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("id");
		Member member = ms.getMember(m_id);
		model.addAttribute("member", member);
		return "myInfoUpdateForm";
	}
	
	@RequestMapping("myInfoUpdate")
	public String myInfoUpdate(HttpSession session, Model model, Member member) {
		String m_id = (String) session.getAttribute("id");
		member.setM_id(m_id);
		int result = ms.myInfoUpdate(member);
		if(result > 0) {
			return "main";
		}else{
			model.addAttribute("member", member);
			return "myInfoUpdateForm";
		}
	}
	
	@RequestMapping("singleGameList")
	public String singleGameList(HttpSession session, Model model) {
		return "singleGameList";
	}
	
	@RequestMapping("multyGameList")
	public String multyGameList(HttpSession session, Model model) {
		return "multyGameList";
	}
	
	// 싱글 게임하기에서 설명 눌렀을때 ajax로 뜨게 하는곳
	@RequestMapping("gameInfo")
	public String gameInfo(String c_id, HttpSession session, Model model) {
		//c_id 받고 session id 받아서 게임명, 설명, 코인, 1위기록, 내기록 출력하게 하는 코드
		String m_id = (String)session.getAttribute("id");
		Contents contents = ms.getContents(c_id);
		Scoretable rankOne = ms.scoreRankOne(c_id);	//해당 게임 1등 정보
		Scoretable myInfo = ms.myScoreInfo(m_id, c_id);
		
		model.addAttribute("contents", contents);
		model.addAttribute("rankOne", rankOne);
		model.addAttribute("myInfo", myInfo);
		return "gameInfo";
	}
	
	//유저 정보 보기
	@RequestMapping("hisInfo")
	public String hisInfo(String his_id, Model model) {
		Member member = ms.getMember(his_id);
		List<Scoretable> hisRank = ss.hisRank(his_id);
		model.addAttribute("member", member);
		model.addAttribute("hisRank", hisRank);
		return "hisInfo";
	}
}
