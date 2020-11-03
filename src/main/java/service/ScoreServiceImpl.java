package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ScoretableDao;
import model.Scoretable;

@Service
public class ScoreServiceImpl implements ScoreService{
	@Autowired
	private ScoretableDao sd;
	
	@Override
	public void scoreInsert(String m_id, String c_id) {
		sd.scoreInsert(m_id, c_id);
	}

	@Override
	public List<Scoretable> scoreList(String c_id) {
		return sd.scoreList(c_id);
	}

	@Override
	public Scoretable getScoretable(String m_id, String c_id) {
		return sd.getScoretable(m_id, c_id);
	}

	@Override
	public void singleGameScoreUpdate(Scoretable st) {
		sd.singleGameScoreUpdate(st);
	}

	@Override
	public List<Scoretable> hisRank(String his_id) {
		return sd.hisRank(his_id);
	}

}
