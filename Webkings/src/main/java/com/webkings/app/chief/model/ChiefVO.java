package com.webkings.app.chief.model;

import java.sql.Timestamp;

public class ChiefVO {
	private int cNo;
	private String cNumber;
	private String cEmail;
	private String cPwd;
	private String cName;
	private String cCname;
	private String cAdd;
	private String cRegdate;
	private Timestamp cChgdate;
	private String cType;
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getcNumber() {
		return cNumber;
	}
	public void setcNumber(String cNumber) {
		this.cNumber = cNumber;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getcPwd() {
		return cPwd;
	}
	public void setcPwd(String cPwd) {
		this.cPwd = cPwd;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcCname() {
		return cCname;
	}
	public void setcCname(String cCname) {
		this.cCname = cCname;
	}
	public String getcAdd() {
		return cAdd;
	}
	public void setcAdd(String cAdd) {
		this.cAdd = cAdd;
	}
	public String getcRegdate() {
		return cRegdate;
	}
	public void setcRegdate(String cRegdate) {
		this.cRegdate = cRegdate;
	}
	public Timestamp getcChgdate() {
		return cChgdate;
	}
	public void setcChgdate(Timestamp cChgdate) {
		this.cChgdate = cChgdate;
	}
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
	}
	@Override
	public String toString() {
		return "ChiefVO [cNo=" + cNo + ", cNumber=" + cNumber + ", cEmail=" + cEmail + ", cPwd=" + cPwd + ", cName="
				+ cName + ", cCname=" + cCname + ", cAdd=" + cAdd + ", cRegdate=" + cRegdate + ", cChgdate=" + cChgdate
				+ ", cType=" + cType + "]";
	}
	
	
	
	
}
