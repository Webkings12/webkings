package com.webkings.app.member.model;

import java.sql.Timestamp;

public class MemberVo {
	private int mNO;//회원번호 
	private String mType;//회원구분값 
	private String mEmail; //이메일
	private String mNlck; //닉네임
	private String mPwd;//비밀번호
	private String mImage;//이미지
	private Timestamp mRegdate; //회원등록일
	private Timestamp mChgdate; //회원수정일 
	public int getmNO() {
		return mNO;
	}
	public void setmNO(int mNO) {
		this.mNO = mNO;
	}
	public String getmType() {
		return mType;
	}
	public void setmType(String mType) {
		this.mType = mType;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmNlck() {
		return mNlck;
	}
	public void setmNlck(String mNlck) {
		this.mNlck = mNlck;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public Timestamp getmRegdate() {
		return mRegdate;
	}
	public void setmRegdate(Timestamp mRegdate) {
		this.mRegdate = mRegdate;
	}
	public Timestamp getmChgdate() {
		return mChgdate;
	}
	public void setmChgdate(Timestamp mChgdate) {
		this.mChgdate = mChgdate;
	}
	@Override
	public String toString() {
		return "MemberVo [mNO=" + mNO + ", mType=" + mType + ", mEmail=" + mEmail + ", mNlck=" + mNlck + ", mPwd="
				+ mPwd + ", mRegdate=" + mRegdate + ", mChgdate=" + mChgdate + "]";
	}
	
	
}
