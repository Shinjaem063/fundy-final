package com.kh.fundy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public Member login(Member m) {
		return session.selectOne("member.login", m);
	}

	@Override
	public int memberCount() {
		return session.selectOne("member.memberCount");
	}

	@Override
	public int memberDeleteAll() {
		return session.delete("member.memberDeleteAll");
	}

	@Override
	public int insertOne(Member m) {
		return session.insert("member.insertOne", m);
	}

	@Override
	public int memberAddress(ShippingAddr s) {
		return session.update("shippingAddr.updateAddress", s);
	}

	@Override
	public List<ShippingAddr> memberAddressView(ShippingAddr s) {
		return session.selectList("shippingAddr.updateAddressView", s);
	}


	public List<Member> selectList() {
		return session.selectList("member.kakao");
	}

	@Override
	public Member selectOneKakao(Member m) {
		return session.selectOne("member.selectOne", m);
	}
	
	
}
