package dao;

import java.util.List;

import model.Buy;
import model.Member;

public interface MemberDao {

	Member confirmId(String m_id);
	int createMeber(Member member);
	Member loginChk(String m_id);
	Member findId(String name, String birthday);
	Member findPw(String m_id);
	Member getMember(String m_id);
	int myInfoUpdate(Member member);
	List<Member> memberList(List<String> listId);
	void heartUse(String m_id);
	void coinUpdate(Member member);

}
