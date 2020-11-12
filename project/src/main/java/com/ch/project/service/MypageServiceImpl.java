package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.MypageDao;
import com.ch.project.model.Member;
import com.ch.project.model.Pet;

@Service
public class MypageServiceImpl implements MypageService{
@Autowired
	private MypageDao md;

@Override
public Member select(String cId) {

	return md.select(cId);
}

public Pet select(int petNumber) {
	
	return md.select(petNumber);
}

public int insert(Pet pet) {
	
	return md.insert(pet);
}

	

}
