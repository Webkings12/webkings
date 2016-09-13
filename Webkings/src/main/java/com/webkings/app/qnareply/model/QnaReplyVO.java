package com.webkings.app.qnareply.model;

import java.sql.Timestamp;

public class QnaReplyVO {
	private int qrNo;//QR_NO NUMBER NOT NULL, /* 댓글번호 */
	private int qrNoGroup;// QR_NO_GROUP NUMBER NOT NULL, /* 댓글번호구분값 */
	private int qrGbn;//QR_GBN NUMBER NOT NULL, /* 댓글구분값 */
	private String qrContent;//QR_CONTENT CLOB NOT NULL, /* 댓글내용 */
	private Timestamp qrRegdate;//QR_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* 댓글등록일 */
	private Timestamp qrChgdate;//QR_CHGDATE DATE, /* 댓글수정일 */
	private int qNo;//Q_NO NUMBER NOT NULL /* 글번호 */
	private int mNo;
	public int getQrNo() {
		return qrNo;
	}
	public void setQrNo(int qrNo) {
		this.qrNo = qrNo;
	}
	public int getQrNoGroup() {
		return qrNoGroup;
	}
	public void setQrNoGroup(int qrNoGroup) {
		this.qrNoGroup = qrNoGroup;
	}
	public int getQrGbn() {
		return qrGbn;
	}
	public void setQrGbn(int qrGbn) {
		this.qrGbn = qrGbn;
	}
	public String getQrContent() {
		return qrContent;
	}
	public void setQrContent(String qrContent) {
		this.qrContent = qrContent;
	}
	public Timestamp getQrRegdate() {
		return qrRegdate;
	}
	public void setQrRegdate(Timestamp qrRegdate) {
		this.qrRegdate = qrRegdate;
	}
	public Timestamp getQrChgdate() {
		return qrChgdate;
	}
	public void setQrChgdate(Timestamp qrChgdate) {
		this.qrChgdate = qrChgdate;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	@Override
	public String toString() {
		return "QnaReplyVO [qrNo=" + qrNo + ", qrNoGroup=" + qrNoGroup + ", qrGbn=" + qrGbn + ", qrContent=" + qrContent
				+ ", qrRegdate=" + qrRegdate + ", qrChgdate=" + qrChgdate + ", qNo=" + qNo + ", mNo=" + mNo + "]";
	}
	
}	
