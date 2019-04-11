package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

public interface MemberService {

	int memberCount();
	int memberDeleteAll();
	int insertOne(Member m);
	Member login(Member m);
	int memberAddress(ShippingAddr s);
	List<ShippingAddr> memberAddressView(ShippingAddr s);
	List<Member> selectList();
	Member selectOneKakao(Member m);
	int memberAddressInsert(ShippingAddr s);
	int memberUpdate(Member m);
	List<Member> memberUpdateView(Member m);
<<<<<<< HEAD
	int memberPwUpdate(Member m);
	int memberPwCheck(Member m);
	int memberNickCheck(String memberNick);
	int memberDelete(Member m);
=======
>>>>>>> refs/heads/feature_kyo
	
	String selectCountUserAuth(String memberEmail);
	int insertUserAuth(String memberEmail, String key);
	int updateUserAuth(String memberEmail, String key);
	



}
