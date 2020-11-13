package com.ch.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.project.model.Member;
import com.ch.project.model.Pet;

@Repository
public class MypageDaoImpl implements MypageDao{
@Autowired
	private SqlSessionTemplate sst;


public Member select(String cId) {
	
	
	return sst.selectOne("memberns.select", cId);
}

public Pet select(int petNumber) {
	// TODO Auto-generated method stub
	return sst.selectOne("mypagens.select2", petNumber);
}

public int insert(Pet pet) {
	
	return sst.insert("mypagens.insert", pet);
}


public int update(Member member) {
	
	return sst.update("mypagens.update", member);
}


public int delete(String cId) {
	
	return sst.delete("mypagens.delete", cId);
}



}
