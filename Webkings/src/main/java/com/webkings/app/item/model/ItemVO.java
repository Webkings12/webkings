package com.webkings.app.item.model;

import java.sql.Timestamp;

public class ItemVO {
    private int iNo;  //아이템 번호
    private String iName;   //아이템이름
    private String iImage;   //아이템 이미지 정보
    private Timestamp iRegdate; //등록일자
    private Timestamp iChgdate; //수정일자
    private int itNo; //아이템타입번호
    private int sNo; //샵번호
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
