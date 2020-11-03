package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Scoretable;

@Repository
public class ScoretableDaoImpl implements ScoretableDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void scoreInsert(String m_id, String c_id) {
		// Map으로 넘기는거
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("c_id", c_id);
		session.insert("scoreInsert", map);
	}

	@Override
	public List<Scoretable> scoreList(String c_id) {
		return session.selectList("scoreList", c_id);
	}

	@Override
	public Scoretable getScoretable(String m_id, String c_id) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("m_id="+m_id+", c_id="+c_id);
		map.put("m_id", m_id);
		map.put("c_id", c_id);
		return session.selectOne("getScoretable", map);
	}

	@Override
	public void singleGameScoreUpdate(Scoretable st) {
		session.update("singleGameScoreUpdate", st);
	}

	@Override
	public List<Scoretable> hisRank(String m_id) {
		return session.selectList("hisRank", m_id);
	}

	@Override
	public Scoretable scoreRankOne(String c_id) {
		return session.selectOne("scoreRankOne", c_id);
	}

	@Override
	public Scoretable myScoreInfo(String m_id, String c_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("c_id", c_id);
		return session.selectOne("myScoreInfo", map);
	}
}
