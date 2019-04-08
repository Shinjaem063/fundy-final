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
	
	//전체보기
	@Override
	public List<AskBoard> selectList(int cPage, int numPerPage) {
		
		return dao.selectList(cPage,numPerPage);
	}

	@Override
	public int selectCount() {
		
		return dao.selectCount();
	}
	
	//작성하기
	@Override
	public int insertAskBoard(AskBoard askBoard) {
		
		return dao.insertAskBoard(askBoard);
	}

	//삭제
	@Override
	public int askBoardDelete(int askNo) {
		
		return dao.askBoardDelete(askNo);
	}
	
	//상세보기
	@Override
	public AskBoard askBoardView(int askNo) {
		return dao.askBoardView(askNo);
	}
	
	//수정하기
	@Override
	public int askBoardUpdate(AskBoard askBoard) {
		return dao.askBoardUpdate(askBoard);
	}

	

	
	

	
	
	
}
