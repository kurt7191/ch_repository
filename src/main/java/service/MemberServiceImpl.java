package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BuyDao;
import dao.ContentsDao;
import dao.MemberDao;
import dao.ScoretableDao;
import model.Buy;
import model.Contents;
import model.Member;
import model.Scoretable;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md;
	@Autowired
	private BuyDao bd;
	@Autowired
	private ContentsDao cd;
	@Autowired
	private ScoretableDao sd;
	
	@Override
	public Member confirmId(String m_id) {
		return md.confirmId(m_id);
	}

	@Override
	public int createMember(Member member) {
		return md.createMeber(member);
	}

	@Override
	public Member loginChk(String m_id) {
		return md.loginChk(m_id);
	}

	@Override
	public Member findId(String name, String birthday) {
		return md.findId(name, birthday);
	}

	@Override
	public Member findPw(String m_id) {
		return md.findPw(m_id);
	}

	@Override
	public Member getMember(String m_id) {
		return md.getMember(m_id);
	}

	@Override
	public int myInfoUpdate(Member member) {
		return md.myInfoUpdate(member);
	}

	@Override
	public List<Member> memberList(List<String> listId) {
		return md.memberList(listId);
	}

	@Override
	public void insertUseyn(String m_id) {
		bd.insertUseyn(m_id);
	}

	@Override
	public void coinUpdate(Member member) {
		md.coinUpdate(member);
	}

	@Override
	public Contents getContents(String c_id) {
		return cd.getContents(c_id);
	}

	@Override
	public Scoretable scoreRankOne(String c_id) {
		return sd.scoreRankOne(c_id);
	}

	@Override
	public Scoretable myScoreInfo(String m_id, String c_id) {
		return sd.myScoreInfo(m_id, c_id);
	}

}
