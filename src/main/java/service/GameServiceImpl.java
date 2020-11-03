package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BuyDao;
import dao.MemberDao;
import model.Buy;

@Service
public class GameServiceImpl implements GameService{
	@Autowired
	private MemberDao md;
	@Autowired
	private BuyDao bd;

	@Override
	public int chkUseyn(Buy buy) {
		return bd.chkUseyn(buy);
	}

	@Override
	public void heartUse(String m_id) {
		md.heartUse(m_id);	
	}
	
}
