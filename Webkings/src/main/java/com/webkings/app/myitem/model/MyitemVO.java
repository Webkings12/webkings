package com.webkings.app.myitem.model;

import java.sql.Timestamp;

public class MyitemVO {
	private int	iNo;
	private int	mNo;
	private int	sNo;
	private	Timestamp mIRerdate;
	
	
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
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public Timestamp getmIRerdate() {
		return mIRerdate;
	}
	public void setmIRerdate(Timestamp mIRerdate) {
		this.mIRerdate = mIRerdate;
	}
	
	@Override
	public String toString() {
		return "MyitemVO [iNo=" + iNo + ", mNo=" + mNo + ", sNo=" + sNo + ", mIRerdate=" + mIRerdate + "]";
	}
	
	
	
	

	
}	
