package com.ch.project.service;

import com.ch.project.model.Member;
import com.ch.project.model.Pet;

public interface MypageService {

	Member select(String cId);

	Pet select(int petNumber);

	int insert(Pet pet);

	int update(Member member);

	int delete(String cId);

}
