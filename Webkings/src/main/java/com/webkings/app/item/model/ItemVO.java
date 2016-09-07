package com.webkings.app.item.model;

import java.sql.Timestamp;

public class ItemVO {
    private int I_NO;  
    private String I_NAME;    
    private String I_IMAGE;   
    private Timestamp I_REGDATE; 
    private Timestamp I_CHGDATE;
    private int IT_NO;
    private int S_NO;
	  
	public int getI_NO() {
		return I_NO;
	}
	public void setI_NO(int i_NO) {
		I_NO = i_NO;
	}
	public String getI_NAME() {
		return I_NAME;
	}
	public void setI_NAME(String i_NAME) {
		I_NAME = i_NAME;
	}
	public String getI_IMAGE() {
		return I_IMAGE;
	}
	public void setI_IMAGE(String i_IMAGE) {
		I_IMAGE = i_IMAGE;
	}
	public Timestamp getI_REGDATE() {
		return I_REGDATE;
	}
	public void setI_REGDATE(Timestamp i_REGDATE) {
		I_REGDATE = i_REGDATE;
	}
	public Timestamp getI_CHGDATE() {
		return I_CHGDATE;
	}
	public void setI_CHGDATE(Timestamp i_CHGDATE) {
		I_CHGDATE = i_CHGDATE;
	}
	public int getIT_NO() {
		return IT_NO;
	}
	public void setIT_NO(int iT_NO) {
		IT_NO = iT_NO;
	}
	public int getS_NO() {
		return S_NO;
	}
	public void setS_NO(int s_NO) {
		S_NO = s_NO;
	}
	
	@Override
	public String toString() {
		return "ItemVO [I_NO=" + I_NO + ", I_NAME=" + I_NAME + ", I_IMAGE=" + I_IMAGE + ", I_REGDATE=" + I_REGDATE
				+ ", I_CHGDATE=" + I_CHGDATE + ", IT_NO=" + IT_NO + ", S_NO=" + S_NO + "]";
	}       
}
