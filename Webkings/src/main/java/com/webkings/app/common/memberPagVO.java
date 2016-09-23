package com.webkings.app.common;

public class memberPagVO extends SearchVO{
	private int mNo;
	private String mEmail;
	
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	@Override
	public String toString() {
		return "memberPagVO [mNo=" + mNo + ", mEmail=" + mEmail + ", toString()=" + super.toString() + "]";
	}
	
	
}
