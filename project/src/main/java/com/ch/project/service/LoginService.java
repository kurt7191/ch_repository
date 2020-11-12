package com.ch.project.service;

import com.ch.project.model.Member;

public interface LoginService {

	Member select(String id);

	int insert(Member member);

}
