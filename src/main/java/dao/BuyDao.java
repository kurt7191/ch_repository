package dao;

import model.Buy;

public interface BuyDao {

	int chkUseyn(Buy buy);
	void insertUseyn(String m_id);
	void updateUseyn(Buy buy);

}
