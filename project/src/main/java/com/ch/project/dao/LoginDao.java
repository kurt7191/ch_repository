package com.ch.project.dao;

import com.ch.project.model.Member;

public interface LoginDao {

	Member select(String id);

	int insert(Member member);

}
