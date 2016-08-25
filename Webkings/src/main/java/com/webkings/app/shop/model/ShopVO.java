package com.webkings.app.shop.model;

import java.sql.Timestamp;

import oracle.sql.CLOB;

public class ShopVO {
	private int s_No; //pk 쇼핑몰 관리번호
	private String s_Domain; // 쇼핑몰도메인
	private String s_Msyn;	//모바일 사이트유무
	private String s_Name;	// 쇼핑몰명
	private String s_Bimage; //쇼핑몰큰이미지
	private String s_Simage;	// 쇼핑몰작은이미지
	private CLOB s_Binfo;		//쇼핑몰 큰설명
	private CLOB s_Sinfo;		//쇼핑몰작은설명
	private String s_Gender;	//쇼핑몰성별구분값
	private String s_Age;		//쇼핑몰연령대구분값
	private String s_Style;	//쇼핑몰스타일구분값
	private String s_Staff;	//담당자명
	private String s_Dep;		//부서명
	private String s_Position;//직급
	private String s_Tel;		//담당자전화번호
	private String s_Phone;	//담당자휴대폰
	private String s_Email;	//담당자이메일
	private int s_Hit;			//조회수
	private String s_Accyn;	//광고신청유무
	private Timestamp s_Accdate;	//광고신청일
	private String s_Payyn;	//결제확인유무
	private Timestamp s_Regdate;	//쇼핑몰등록일
	private Timestamp s_Chgdate;	//쇼핑몰수정일
	
	//get//set
	public int getS_No() {
		return s_No;
	}
	public void setS_No(int s_No) {
		this.s_No = s_No;
	}
	public String getS_Domain() {
		return s_Domain;
	}
	public void setS_Domain(String s_Domain) {
		this.s_Domain = s_Domain;
	}
	public String getS_Msyn() {
		return s_Msyn;
	}
	public void setS_Msyn(String s_Msyn) {
		this.s_Msyn = s_Msyn;
	}
	public String getS_Name() {
		return s_Name;
	}
	public void setS_Name(String s_Name) {
		this.s_Name = s_Name;
	}
	public String getS_Bimage() {
		return s_Bimage;
	}
	public void setS_Bimage(String s_Bimage) {
		this.s_Bimage = s_Bimage;
	}
	public String getS_Simage() {
		return s_Simage;
	}
	public void setS_Simage(String s_Simage) {
		this.s_Simage = s_Simage;
	}
	public CLOB getS_Binfo() {
		return s_Binfo;
	}
	public void setS_Binfo(CLOB s_Binfo) {
		this.s_Binfo = s_Binfo;
	}
	public CLOB getS_Sinfo() {
		return s_Sinfo;
	}
	public void setS_Sinfo(CLOB s_Sinfo) {
		this.s_Sinfo = s_Sinfo;
	}
	public String getS_Gender() {
		return s_Gender;
	}
	public void setS_Gender(String s_Gender) {
		this.s_Gender = s_Gender;
	}
	public String getS_Age() {
		return s_Age;
	}
	public void setS_Age(String s_Age) {
		this.s_Age = s_Age;
	}
	public String getS_Style() {
		return s_Style;
	}
	public void setS_Style(String s_Style) {
		this.s_Style = s_Style;
	}
	public String getS_Staff() {
		return s_Staff;
	}
	public void setS_Staff(String s_Staff) {
		this.s_Staff = s_Staff;
	}
	public String getS_Dep() {
		return s_Dep;
	}
	public void setS_Dep(String s_Dep) {
		this.s_Dep = s_Dep;
	}
	public String getS_Position() {
		return s_Position;
	}
	public void setS_Position(String s_Position) {
		this.s_Position = s_Position;
	}
	public String getS_Tel() {
		return s_Tel;
	}
	public void setS_Tel(String s_Tel) {
		this.s_Tel = s_Tel;
	}
	public String getS_Phone() {
		return s_Phone;
	}
	public void setS_Phone(String s_Phone) {
		this.s_Phone = s_Phone;
	}
	public String getS_Email() {
		return s_Email;
	}
	public void setS_Email(String s_Email) {
		this.s_Email = s_Email;
	}
	public int getS_Hit() {
		return s_Hit;
	}
	public void setS_Hit(int s_Hit) {
		this.s_Hit = s_Hit;
	}
	public String getS_Accyn() {
		return s_Accyn;
	}
	public void setS_Accyn(String s_Accyn) {
		this.s_Accyn = s_Accyn;
	}
	public Timestamp getS_Accdate() {
		return s_Accdate;
	}
	public void setS_Accdate(Timestamp s_Accdate) {
		this.s_Accdate = s_Accdate;
	}
	public String getS_Payyn() {
		return s_Payyn;
	}
	public void setS_Payyn(String s_Payyn) {
		this.s_Payyn = s_Payyn;
	}
	public Timestamp getS_Regdate() {
		return s_Regdate;
	}
	public void setS_Regdate(Timestamp s_Regdate) {
		this.s_Regdate = s_Regdate;
	}
	public Timestamp getS_Chgdate() {
		return s_Chgdate;
	}
	public void setS_Chgdate(Timestamp s_Chgdate) {
		this.s_Chgdate = s_Chgdate;
	}
	
	//tostring
	@Override
	public String toString() {
		return "ShopVO [s_No=" + s_No + ", s_Domain=" + s_Domain + ", s_Msyn=" + s_Msyn + ", s_Name=" + s_Name
				+ ", s_Bimage=" + s_Bimage + ", s_Simage=" + s_Simage + ", s_Binfo=" + s_Binfo + ", s_Sinfo=" + s_Sinfo
				+ ", s_Gender=" + s_Gender + ", s_Age=" + s_Age + ", s_Style=" + s_Style + ", s_Staff=" + s_Staff
				+ ", s_Dep=" + s_Dep + ", s_Position=" + s_Position + ", s_Tel=" + s_Tel + ", s_Phone=" + s_Phone
				+ ", s_Email=" + s_Email + ", s_Hit=" + s_Hit + ", s_Accyn=" + s_Accyn + ", s_Accdate=" + s_Accdate
				+ ", s_Payyn=" + s_Payyn + ", s_Regdate=" + s_Regdate + ", s_Chgdate=" + s_Chgdate + "]";
	}
	
}
