package com.webkings.app.item.model;

public class ItemViewVO {
	
	/*카테고리 아이템 select*/
	private int iNo;
	private String iDomain; 
	private int sNo;
	public String getiDomain() {
		return iDomain;
	}

	public void setiDomain(String iDomain) {
		this.iDomain = iDomain;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	private String iImage; 
	private String iName; 
	private String iSalePrice; 
	private String sName; 
	private String sAge; 
	private String itGender; 
	private String itName;
	private int iClick;
	private String dateType;	
	private String iPrice;
	
	public String getiPrice() {
		return iPrice;
	}

	public void setiPrice(String iPrice) {
		this.iPrice = iPrice;
	}

	public String getDateType() {
		return dateType;
	}

	public void setDateType(String dateType) {
		this.dateType = dateType;
	}

	public int getiClick() {
		return iClick;
	}

	public void setiClick(int iClick) {
		this.iClick = iClick;
	}

	public int getiNo() {
		return iNo;
	}
	
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public String getiSalePrice() {
		return iSalePrice;
	}
	public void setiSalePrice(String iSalePrice) {
		this.iSalePrice = iSalePrice;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsAge() {
		return sAge;
	}
	public void setsAge(String sAge) {
		this.sAge = sAge;
	}
	public String getItGender() {
		return itGender;
	}
	public void setItGender(String itGender) {
		this.itGender = itGender;
	}
	public String getItName() {
		return itName;
	}
	public void setItName(String itName) {
		this.itName = itName;
	}
	
	@Override
	public String toString() {
		return "ItemViewVO [iNo=" + iNo + ", iDomain=" + iDomain + ", sNo=" + sNo + ", iImage=" + iImage + ", iName="
				+ iName + ", iSalePrice=" + iSalePrice + ", sName=" + sName + ", sAge=" + sAge + ", itGender="
				+ itGender + ", itName=" + itName + ", iClick=" + iClick + ", dateType=" + dateType + ", iPrice="
				+ iPrice + "]";
	}
	
}
