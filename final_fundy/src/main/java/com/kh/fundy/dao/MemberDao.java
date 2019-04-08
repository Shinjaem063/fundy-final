package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

public interface MemberDao {

	int memberCount();
	int memberDeleteAll();
	int insertOne(Member m);
	Member login(Member m);
	int memberAddress(ShippingAddr s);
	List<ShippingAddr> memberAddressView(ShippingAddr s);
	
}
