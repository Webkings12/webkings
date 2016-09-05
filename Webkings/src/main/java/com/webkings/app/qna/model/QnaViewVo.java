package com.webkings.app.qna.model;

import java.sql.Timestamp;

public class QnaViewVo {
	private int qNo;
	private String qTitle;
	private String qContent;
	private String qEmail;
	private String qTel;
	private Timestamp qRegdate;
	private int mNo;
	private String mEmail; //이메일
	private String mNick; //닉네임
	private int newImgTerm;
	public int getNewImgTerm() {
		return newImgTerm;
	}
	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqEmail() {
		return qEmail;
	}
	public void setqEmail(String qEmail) {
		this.qEmail = qEmail;
	}
	public String getqTel() {
		return qTel;
	}
	public void setqTel(String qTel) {
		this.qTel = qTel;
	}
	public Timestamp getqRegdate() {
		return qRegdate;
	}
	public void setqRegdate(Timestamp qRegdate) {
		this.qRegdate = qRegdate;
	}
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
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	@Override
	public String toString() {
		return "QnaViewVo [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qEmail=" + qEmail
				+ ", qTel=" + qTel + ", qRegdate=" + qRegdate + ", mNo=" + mNo + ", mEmail=" + mEmail + ", mNick="
				+ mNick + ", newImgTerm=" + newImgTerm + "]";
	}
	
}
