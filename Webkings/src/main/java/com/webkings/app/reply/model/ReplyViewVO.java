package com.webkings.app.reply.model;

import java.sql.Timestamp;

public class ReplyViewVO {
	private int rNo;//R_NO NUMBER NOT NULL, /* 댓글번호 */
	private int rNoGroup;// R_NO_GROUP NUMBER NOT NULL, /* 댓글번호구분값 */
	private int rGbn;//R_GBN NUMBER NOT NULL, /* 댓글구분값 */
	private String rContent;//R_CONTENT CLOB NOT NULL, /* 댓글내용 */
	private Timestamp rRegdate;//R_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* 댓글등록일 */
	private Timestamp rChgdate;//R_CHGDATE DATE, /* 댓글수정일 */
	private int bNo;//B_NO NUMBER NOT NULL /* 글번호 */
	private int mNo;
	private String mEmail;
	private String mImage;//이미지
	private String mNick; //닉네임
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getrNoGroup() {
		return rNoGroup;
	}
	public void setrNoGroup(int rNoGroup) {
		this.rNoGroup = rNoGroup;
	}
	public int getrGbn() {
		return rGbn;
	}
	public void setrGbn(int rGbn) {
		this.rGbn = rGbn;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Timestamp getrRegdate() {
		return rRegdate;
	}
	public void setrRegdate(Timestamp rRegdate) {
		this.rRegdate = rRegdate;
	}
	public Timestamp getrChgdate() {
		return rChgdate;
	}
	public void setrChgdate(Timestamp rChgdate) {
		this.rChgdate = rChgdate;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
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
	public String getmImage() {
		return mImage;
	}
	public void setmImage(String mImage) {
		this.mImage = mImage;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	@Override
	public String toString() {
		return "ReplyVo [rNo=" + rNo + ", rNoGroup=" + rNoGroup + ", rGbn=" + rGbn + ", rContent=" + rContent
				+ ", rRegdate=" + rRegdate + ", rChgdate=" + rChgdate + ", bNo=" + bNo + ", mNo=" + mNo + ", mEmail="
				+ mEmail + ", mImage=" + mImage + ", mNick=" + mNick + "]";
	}
	
}
