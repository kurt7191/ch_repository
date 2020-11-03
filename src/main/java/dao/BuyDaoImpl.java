package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Buy;

@Repository
public class BuyDaoImpl implements BuyDao{
	@Autowired
	private SqlSession session;

	@Override
	public int chkUseyn(Buy buy) {
		return session.selectOne("chkUseyn", buy);
	}

	@Override
	public void insertUseyn(String m_id) {
		session.insert("insertUseyn", m_id);
	}

	@Override
	public void updateUseyn(Buy buy) {
		session.update("updateUseyn", buy);
	}
}
