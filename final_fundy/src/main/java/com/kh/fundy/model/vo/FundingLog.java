package com.kh.fundy.model.vo;

import java.sql.Timestamp;

public class FundingLog {
	
	private int fundingLogNo;
	private String memberEmail;
	private int projectNo;
	private String deliveryStatCode;
	private int packageNo;
	private int packageAmount;
	private int extraMoney;
	private Timestamp funderDate;
	private String anonymous;
	private String impUid;
	private String merchantUid;
	private String paidAmount;
	private String applyNum;
	
	private String memberNick;
	private String memberProfile;
	private int fundPrice;

	public FundingLog() {}

	public FundingLog(int fundingLogNo, String memberEmail, int projectNo, String deliveryStatCode, int packageNo,
			int packageAmount, int extraMoney, Timestamp funderDate, String anonymous, String impUid,
			String merchantUid, String paidAmount, String applyNum, String memberNick, String memberProfile,
			int fundPrice) {
		super();
		this.fundingLogNo = fundingLogNo;
		this.memberEmail = memberEmail;
		this.projectNo = projectNo;
		this.deliveryStatCode = deliveryStatCode;
		this.packageNo = packageNo;
		this.packageAmount = packageAmount;
		this.extraMoney = extraMoney;
		this.funderDate = funderDate;
		this.anonymous = anonymous;
		this.impUid = impUid;
		this.merchantUid = merchantUid;
		this.paidAmount = paidAmount;
		this.applyNum = applyNum;
		this.memberNick = memberNick;
		this.memberProfile = memberProfile;
		this.fundPrice = fundPrice;
	}

	public int getFundingLogNo() {
		return fundingLogNo;
	}

	public void setFundingLogNo(int fundingLogNo) {
		this.fundingLogNo = fundingLogNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getDeliveryStatCode() {
		return deliveryStatCode;
	}

	public void setDeliveryStatCode(String deliveryStatCode) {
		this.deliveryStatCode = deliveryStatCode;
	}

	public int getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
	}

	public int getPackageAmount() {
		return packageAmount;
	}

	public void setPackageAmount(int packageAmount) {
		this.packageAmount = packageAmount;
	}

	public int getExtraMoney() {
		return extraMoney;
	}

	public void setExtraMoney(int extraMoney) {
		this.extraMoney = extraMoney;
	}

	public Timestamp getFunderDate() {
		return funderDate;
	}

	public void setFunderDate(Timestamp funderDate) {
		this.funderDate = funderDate;
	}

	public String getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(String paidAmount) {
		this.paidAmount = paidAmount;
	}

	public String getApplNum() {
		return applyNum;
	}

	public void setApplNum(String applyNum) {
		this.applyNum = applyNum;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}

	public int getFundPrice() {
		return fundPrice;
	}

	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}

}
