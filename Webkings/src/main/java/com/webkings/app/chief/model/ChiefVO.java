package com.webkings.app.chief.model;

import java.sql.Timestamp;

public class ChiefVO {
	private int C_NO;
	private String C_NUMBER;
	private String C_EMAIL;
	private String C_PWD;
	private String C_NAME;
	private String C_CNAME;
	private String C_ADD;
	private String C_REGDATE;
	private Timestamp C_CHGDATE;
	private String C_TYPE;

	public int getC_NO() {
		return C_NO;
	}

	public void setC_NO(int c_NO) {
		C_NO = c_NO;
	}

	public String getC_NUMBER() {
		return C_NUMBER;
	}

	public void setC_NUMBER(String c_NUMBER) {
		C_NUMBER = c_NUMBER;
	}

	public String getC_EMAIL() {
		return C_EMAIL;
	}

	public void setC_EMAIL(String c_EMAIL) {
		C_EMAIL = c_EMAIL;
	}

	public String getC_PWD() {
		return C_PWD;
	}

	public void setC_PWD(String c_PWD) {
		C_PWD = c_PWD;
	}

	public String getC_NAME() {
		return C_NAME;
	}

	public void setC_NAME(String c_NAME) {
		C_NAME = c_NAME;
	}

	public String getC_CNAME() {
		return C_CNAME;
	}

	public void setC_CNAME(String c_CNAME) {
		C_CNAME = c_CNAME;
	}

	public String getC_ADD() {
		return C_ADD;
	}

	public void setC_ADD(String c_ADD) {
		C_ADD = c_ADD;
	}

	public String getC_REGDATE() {
		return C_REGDATE;
	}

	public void setC_REGDATE(String c_REGDATE) {
		C_REGDATE = c_REGDATE;
	}

	public Timestamp getC_CHGDATE() {
		return C_CHGDATE;
	}

	public void setC_CHGDATE(Timestamp c_CHGDATE) {
		C_CHGDATE = c_CHGDATE;
	}

	public String getC_TYPE() {
		return C_TYPE;
	}

	public void setC_TYPE(String c_TYPE) {
		C_TYPE = c_TYPE;
	}
	
	public ChiefVO(int c_NO, String c_NUMBER, String c_EMAIL, String c_PWD, String c_NAME, String c_CNAME, String c_ADD,
			String c_REGDATE, Timestamp c_CHGDATE, String c_TYPE) {
		super();
		C_NO = c_NO;
		C_NUMBER = c_NUMBER;
		C_EMAIL = c_EMAIL;
		C_PWD = c_PWD;
		C_NAME = c_NAME;
		C_CNAME = c_CNAME;
		C_ADD = c_ADD;
		C_REGDATE = c_REGDATE;
		C_CHGDATE = c_CHGDATE;
		C_TYPE = c_TYPE;
	}
}
