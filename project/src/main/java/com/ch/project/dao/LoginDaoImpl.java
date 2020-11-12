package com.ch.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Member;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	
	   private SqlSessionTemplate sst;

	public Member select(String id) {
	
		return sst.selectOne("memberns.select", id);
	}

	public int insert(Member member) {
		
		return sst.insert("memberns.insert", member);
	}
	
}
 