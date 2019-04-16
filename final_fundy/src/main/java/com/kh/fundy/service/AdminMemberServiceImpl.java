package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.AdminMemberDao;
import com.kh.fundy.model.vo.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberDao dao;

	@Override
	public List<Member> memberListView(Member m) {
		return dao.memberListView(m);
	}
	

}
