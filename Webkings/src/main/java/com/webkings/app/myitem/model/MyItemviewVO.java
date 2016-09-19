package com.webkings.app.myitem.model;

import java.sql.Timestamp;

public class MyItemviewVO {
	private int iNo;
	private int mNo;
	private Timestamp mIRegdate;
	private String iName;
	private String iImage;
	private int iSaleprice;
	private int iPrice;
	private String sName;
	private String iDomain;
	private String itGender;
	private String itName;
	
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public Timestamp getmIRegdate() {
		return mIRegdate;
	}
	public void setmIRegdate(Timestamp mIRegdate) {
		this.mIRegdate = mIRegdate;
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
	public int getiSaleprice() {
		return iSaleprice;
	}
	public void setiSaleprice(int iSaleprice) {
		this.iSaleprice = iSaleprice;
	}
	public int getiPrice() {
		return iPrice;
	}
	public void setiPrice(int iPrice) {
		this.iPrice = iPrice;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getiDomain() {
		return iDomain;
	}
	public void setiDomain(String iDomain) {
		this.iDomain = iDomain;
	}
	public String getItGender() {
		return itGender;
	}
	public void setItGender(String itGender) {
		this.itGender = itGender;
	}
	public String getItName() {
		return itName;
	}
	public void setItName(String itName) {
		this.itName = itName;
	}
	@Override
	public String toString() {
		return "MyItemviewVO [iNo=" + iNo + ", mNo=" + mNo + ", mIRegdate=" + mIRegdate + ", iName=" + iName
				+ ", iImage=" + iImage + ", iSaleprice=" + iSaleprice + ", iPrice=" + iPrice + ", sName=" + sName
				+ ", iDomain=" + iDomain + ", itGender=" + itGender + ", itName=" + itName + "]";
	}
	
	
}
