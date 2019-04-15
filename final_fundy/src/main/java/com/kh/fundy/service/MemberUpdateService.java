package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

public interface MemberUpdateService {
	
	int memberUpdate(Member m);
	List<Member> memberUpdateView(Member m);
	int memberPwUpdate(Member m);
	int memberPwCheck(Member m);
	int memberNickCheck(String memberNick);
	int memberDelete(Member m);
	int updateAddr(ShippingAddr sa);
	int insertAddr(ShippingAddr sa);
	List<ShippingAddr> selectAddrList(String memberEmail);
	ShippingAddr selectAddr(ShippingAddr sa);
	int deleteAddr(ShippingAddr sa);

}
