package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.MemberUpdateDao;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

@Service
public class MemberUpdateServiceImpl implements MemberUpdateService {

	@Autowired
	private MemberUpdateDao dao;
	
	
	@Override
	public int memberUpdate(Member m) {
		return dao.memberUpdate(m);
	}
	
	@Override
	public List<Member> memberUpdateView(Member m) {
		return dao.memberUpdateView(m);
	}
	
	@Override
	public int memberPwUpdate(Member m) {
		return dao.memberPwUpdate(m);
	}

	@Override
	public int memberPwCheck(Member m) {
		return dao.memberPwCheck(m);
	}

	@Override
	public int memberNickCheck(String memberNick) {
		return dao.memberNickCheck(memberNick);
	}

	@Override
	public int memberDelete(Member m) {
		return dao.memberDelete(m);
	}
	
	@Override
	public int updateAddr(ShippingAddr sa) {
		return dao.updateAddr(sa);
	}
	
	@Override
	public int insertAddr(ShippingAddr sa) {
		return dao.insertAddr(sa);
	}
	
	@Override
	public List<ShippingAddr> selectAddrList(String memberEmail) {
		return dao.selectAddrList(memberEmail);
	}

	@Override
	public ShippingAddr selectAddr(ShippingAddr sa) {
		return dao.selectAddr(sa);
	}

	@Override
	public int deleteAddr(ShippingAddr sa) {
		return dao.deleteAddr(sa);
	}

}
