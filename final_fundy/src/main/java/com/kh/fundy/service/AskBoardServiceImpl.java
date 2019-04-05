package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.AskBoardDao;
import com.kh.fundy.model.vo.AskBoard;

@Service
public class AskBoardServiceImpl implements AskBoardService {

	@Autowired
	private AskBoardDao dao;
	
	@Override
	public List<AskBoard> selectList(int cPage, int numPerPage) {
		
		return dao.selectList(cPage,numPerPage);
	}

	@Override
	public int selectCount() {
		
		return dao.selectCount();
	}

	
	
}
