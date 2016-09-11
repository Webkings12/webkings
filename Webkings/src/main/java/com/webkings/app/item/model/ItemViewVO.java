package com.webkings.app.item.model;

public class ItemViewVO {
	
	/*카테고리 아이템 select*/
	
	private int iNo;
	private String sDomain; 
	private String iImage; 
	private String iName; 
	private String iSalePrice; 
	private String sName; 
	private String sAge; 
	private String itGender; 
	private String itName;
	private int iClick;
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
	public String getsDomain() {
		return sDomain;
	}
	public void setsDomain(String sDomain) {
		this.sDomain = sDomain;
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
		return "ItemViewVO [iNo=" + iNo + ", sDomain=" + sDomain + ", iImage=" + iImage + ", iName=" + iName
				+ ", iSalePrice=" + iSalePrice + ", sName=" + sName + ", sAge=" + sAge + ", itGender=" + itGender
				+ ", itName=" + itName + ", iClick=" + iClick + "]";
	}
	
}
