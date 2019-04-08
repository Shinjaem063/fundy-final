package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.CategoryDao;
import com.kh.fundy.model.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao dao;

	@Override
	public List<Category> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Category> selectAllMid() {
		return dao.selectAllMid();
	}

	@Override
	public List<Category> selectAllMinor() {
		// TODO Auto-generated method stub
		return dao.selectAllMinor();
	}

}
