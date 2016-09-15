package com.webkings.app.shop.model;

import java.security.Timestamp;

public class ShopViewVO {
	 private int sNo;
	 private String sDomain;
	 private String sName;
	 private String sBimage;
	 private String sSimage;
	 private String stName; 
	 private Timestamp sRegdate;
	 private String sClick;
	 private String stGender;
	 private String searchKeyword;
	 
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getStGender() {
		return stGender;
	}
	public void setStGender(String stGender) {
		this.stGender = stGender;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getsDomain() {
		return sDomain;
	}
	public void setsDomain(String sDomain) {
		this.sDomain = sDomain;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsBimage() {
		return sBimage;
	}
	public void setsBimage(String sBimage) {
		this.sBimage = sBimage;
	}
	public String getsSimage() {
		return sSimage;
	}
	public void setsSimage(String sSimage) {
		this.sSimage = sSimage;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public Timestamp getsRegdate() {
		return sRegdate;
	}
	public void setsRegdate(Timestamp sRegdate) {
		this.sRegdate = sRegdate;
	}
	public String getsClick() {
		return sClick;
	}
	public void setsClick(String sClick) {
		this.sClick = sClick;
	}
	
	@Override
	public String toString() {
		return "ShopViewVO [sNo=" + sNo + ", sDomain=" + sDomain + ", sName=" + sName + ", sBimage=" + sBimage
				+ ", sSimage=" + sSimage + ", stName=" + stName + ", sRegdate=" + sRegdate + ", sClick=" + sClick
				+ ", stGender=" + stGender + ", searchKeyword=" + searchKeyword + "]";
	}
	 
	 
}
