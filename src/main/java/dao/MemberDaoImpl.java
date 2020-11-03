package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Buy;
import model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public Member confirmId(String m_id) {
		return session.selectOne("confirmId", m_id);
	}

	@Override
	public int createMeber(Member member) {
		return session.insert("createMeber", member);
	}

	@Override
	public Member loginChk(String m_id) {
		return session.selectOne("loginChk", m_id);
	}

	@Override
	public Member findId(String name, String birthday) {
		// Map으로 넘기는거
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("birthday", birthday);
		return session.selectOne("findId", map);
	}

	@Override
	public Member findPw(String m_id) {
		return session.selectOne("findPw", m_id);
	}

	@Override
	public Member getMember(String m_id) {
		return session.selectOne("getMember", m_id);
	}

	@Override
	public int myInfoUpdate(Member member) {
		return session.update("myInfoUpdate", member);
	}

	@Override
	public List<Member> memberList(List<String> listId) {
		String m_id = "";
		List<Member> list = new ArrayList<>();
		for(int i=0; i<listId.size(); i++) {
			m_id = listId.get(i);
			list.add(session.selectOne("memberList", m_id));
		}	
		return list;	
	}

	@Override
	public void heartUse(String m_id) {
		session.update("heartUse", m_id);	
	}

	@Override
	public void coinUpdate(Member member) {
		session.update("coinUpdate", member);
	}

}
