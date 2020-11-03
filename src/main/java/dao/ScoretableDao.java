package dao;

import java.util.List;

import model.Scoretable;

public interface ScoretableDao {

	void scoreInsert(String m_id, String c_id);
	List<Scoretable> scoreList(String c_id);
	Scoretable getScoretable(String m_id, String c_id);
	void singleGameScoreUpdate(Scoretable st);
	List<Scoretable> hisRank(String his_id);
	Scoretable scoreRankOne(String c_id);
	Scoretable myScoreInfo(String m_id, String c_id);
}
