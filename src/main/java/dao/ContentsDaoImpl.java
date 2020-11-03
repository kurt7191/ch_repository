package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Buy;
import model.Contents;

@Repository
public class ContentsDaoImpl implements ContentsDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public int getC_coin(String c_id) {
		return session.selectOne("getC_coin", c_id);
	}

	@Override
	public Contents getContents(String c_id) {
		return session.selectOne("getContents", c_id);
	}
}
