package service;

import java.util.List;

import model.Scoretable;

public interface ScoreService {

	void scoreInsert(String m_id, String c_id);
	List<Scoretable> scoreList(String c_id);
	Scoretable getScoretable(String m_id, String c_id);
	void singleGameScoreUpdate(Scoretable st);
	List<Scoretable> hisRank(String his_id);

}
