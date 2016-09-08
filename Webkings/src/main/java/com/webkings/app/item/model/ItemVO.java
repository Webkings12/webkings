package com.webkings.app.item.model;

import java.sql.Timestamp;

public class ItemVO {
    private int iNo;  
    private String iName;    
    private String iImage;   
    private Timestamp iRegdate; 
    private Timestamp iChgdate;
    private int itNo;
    private int sNo;
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	public Timestamp getiRegdate() {
		return iRegdate;
	}
	public void setiRegdate(Timestamp iRegdate) {
		this.iRegdate = iRegdate;
	}
	public Timestamp getiChgdate() {
		return iChgdate;
	}
	public void setiChgdate(Timestamp iChgdate) {
		this.iChgdate = iChgdate;
	}
	public int getItNo() {
		return itNo;
	}
	public void setItNo(int itNo) {
		this.itNo = itNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	@Override
	public String toString() {
		return "ItemVO [iNo=" + iNo + ", iName=" + iName + ", iImage=" + iImage + ", iRegdate=" + iRegdate
				+ ", iChgdate=" + iChgdate + ", itNo=" + itNo + ", sNo=" + sNo + "]";
	}
	
}
