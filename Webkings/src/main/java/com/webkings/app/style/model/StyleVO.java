package com.webkings.app.style.model;

public class StyleVO {
	  private int stNo;
	  private String stGender;
	  private String stName;
	  
	public int getStNo() {
		return stNo;
	}
	public void setStNo(int stNo) {
		this.stNo = stNo;
	}
	public String getStGender() {
		return stGender;
	}
	public void setStGender(String stGender) {
		this.stGender = stGender;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	
	@Override
	public String toString() {
		return "StyleVO [stNo=" + stNo + ", stGender=" + stGender + ", stName=" + stName + "]";
	}
}
