package com.kh.fundy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.MemberDao;
import com.kh.fundy.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Override
	public int memberCount() {
		return dao.memberCount();
	}

	@Override
	public Member login(Member m) {
		return dao.login(m);
	}

	@Override
	public int memberDeleteAll() {
		return dao.memberDeleteAll();
	}

	@Override
	public int insertOne(Member m) {
		return dao.insertOne(m);
	}

}
