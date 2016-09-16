package com.webkings.app.myitem.model;

import java.sql.Timestamp;

public class MyitemVO {
	private int mINo;
	private int	iNo;
	private int	mNo;
	private	String mIName;
	private	String mIImage; 
	private	Timestamp mIRerdate;
	public int getmINo() {
		return mINo;
	}
	public void setmINo(int mINo) {
		this.mINo = mINo;
	}
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
	public String getmIName() {
		return mIName;
	}
	public void setmIName(String mIName) {
		this.mIName = mIName;
	}
	public String getmIImage() {
		return mIImage;
	}
	public void setmIImage(String mIImage) {
		this.mIImage = mIImage;
	}
	public Timestamp getmIRerdate() {
		return mIRerdate;
	}
	public void setmIRerdate(Timestamp mIRerdate) {
		this.mIRerdate = mIRerdate;
	}
	@Override
	public String toString() {
		return "MyitemVO [mINo=" + mINo + ", iNo=" + iNo + ", mNo=" + mNo + ", mIName=" + mIName + ", mIImage="
				+ mIImage + ", mIRerdate=" + mIRerdate + "]";
	}

	
}	
