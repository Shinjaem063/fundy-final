package com.kh.fundy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.ProjectListDao;
import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Project;

@Service
public class ProjectListServiceImpl implements ProjectListService {

	@Autowired
	private ProjectListDao dao;

	@Override
	public int selectCount(Map map) {
		return dao.selectCount(map);
	}

	@Override
	public List<Project> selectList(int cPage, int numPerPage, Map map) {
		return dao.selectList(cPage, numPerPage, map);
	}

	@Override
	public Project selectOne(Map map) {
		Project p = dao.selectOne(map);
		List<FundingOption> foList = dao.selectFundingOptionList(p.getProjectNo());
		for(FundingOption fo : foList)
		{
			fo.setOdList(dao.selectOptionDetailList(fo.getPackageNo()));
		}
		p.setFoList(foList);
		return p;
	}

	@Override
	public List<FundingLog> selectFunderList(int projectNo) {
		return dao.selectFunderList(projectNo);
	}

	@Override
	public int memberDelete(String memberEmail) {
		return dao.memberDelete(memberEmail);
	}
	
	public List<FundingOption> selectFundingOptionList(int projectNo) {
		List<FundingOption> foList = dao.selectFundingOptionList(projectNo);
		for(FundingOption fo : foList)
		{
			fo.setOdList(dao.selectOptionDetailList(projectNo));
		}
		return foList;
	}

}
