package com.webkings.app.qna.model;

import java.security.Timestamp;

public class QnaVO {
	private int qNo;
	private String qTitle;
	private String qContent;
	private String qEmail;
	private String qTel;
	private Timestamp qRegdate;
	private int mNo;
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
	@Override
	public String toString() {
		return "QnaVO [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qEmail=" + qEmail + ", qTel="
				+ qTel + ", qRegdate=" + qRegdate + ", mNo=" + mNo + "]";
	}
	
}
