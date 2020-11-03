package service;

import java.util.List;

import model.Buy;
import model.Contents;
import model.Member;
import model.Scoretable;

public interface MemberService {

	Member confirmId(String m_id);
	int createMember(Member member);
	Member loginChk(String m_id);
	Member findId(String name, String birthday);
	Member findPw(String m_id);
	Member getMember(String m_id);
	int myInfoUpdate(Member member);
	List<Member> memberList(List<String> listId);
	void insertUseyn(String m_id);
	void coinUpdate(Member member);
	Contents getContents(String c_id);
	Scoretable scoreRankOne(String c_id);
	Scoretable myScoreInfo(String m_id, String c_id);

}
