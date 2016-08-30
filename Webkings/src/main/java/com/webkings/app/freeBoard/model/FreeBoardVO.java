package com.webkings.app.freeBoard.model;

import java.sql.Timestamp;

public class FreeBoardVO {
	private int bNo; //NUMBER NOT NULL, /* 글번호 */
	private String bTitle; //B_TITLE VARCHAR2(200) NOT NULL, /* 글제목 */
	private String bContent; //B_CONTENT CLOB NOT NULL, /* 글내용 */
	private String bFilename; //B_FILENAME VARCHAR2(200), /* 업로드파일명 */
	private long bFilesize; //B_FILESIZE NUMBER, /* 파일크기 */
	private String bOriginalfilename; //B_ORIGINALFILENAME VARCHAR2(200), /* 파일명 */
	private Timestamp bRegdate; //B_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* 글등록일 */
	private Timestamp bChgdate; //B_CHGDATE DATE, /* 글수정일 */
	private int mNo;//M_NO NUMBER NOT NULL /* 회원번호 */
	
	@Override
	public String toString() {
		return "FreeBoardVO [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bFilename=" + bFilename
				+ ", bFilesize=" + bFilesize + ", bOriginalfilename=" + bOriginalfilename + ", bRegdate=" + bRegdate
				+ ", bChgdate=" + bChgdate + ", mNo=" + mNo + "]";
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbFilename() {
		return bFilename;
	}
	public void setbFilename(String bFilename) {
		this.bFilename = bFilename;
	}
	public long getbFilesize() {
		return bFilesize;
	}
	public void setbFilesize(long bFilesize) {
		this.bFilesize = bFilesize;
	}
	public String getbOriginalfilename() {
		return bOriginalfilename;
	}
	public void setbOriginalfilename(String bOriginalfilename) {
		this.bOriginalfilename = bOriginalfilename;
	}
	public Timestamp getbRegdate() {
		return bRegdate;
	}
	public void setbRegdate(Timestamp bRegdate) {
		this.bRegdate = bRegdate;
	}
	public Timestamp getbChgdate() {
		return bChgdate;
	}
	public void setbChgdate(Timestamp bChgdate) {
		this.bChgdate = bChgdate;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
}
