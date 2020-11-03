package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BuyDao;
import dao.ContentsDao;
import dao.MemberDao;
import model.Buy;

@Service
public class BuyServiceImpl implements BuyService{
	@Autowired
	private MemberDao md;
	@Autowired
	private BuyDao bd;
	@Autowired
	private ContentsDao cd;
	
	@Override
	public int getC_coin(String c_id) {
		return cd.getC_coin(c_id);
	}

	@Override
	public void updateUseyn(Buy buy) {
		bd.updateUseyn(buy);
	}

}
