package com.ch.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.project.dao.LoginDao;
import com.ch.project.model.Member;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	
	private LoginDao ld;

	
	public Member select(String id) {
		return ld.select(id);
	}


	public int insert(Member member) {

		return ld.insert(member);
	}

	
}
