package com.webkings.app.shop.model;

public class ShopNameViewVO {
	private String sName;
	private int cNo;
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	@Override
	public String toString() {
		return "ShopNameViewVO [sName=" + sName + ", cNo=" + cNo + "]";
	}
	
}
