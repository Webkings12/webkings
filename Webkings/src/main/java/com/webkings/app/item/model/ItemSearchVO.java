package com.webkings.app.item.model;

public class ItemSearchVO {
		private String sw2;		//검색어
		private String ssp; //가격 시작
		private String sep;	//가격 끝
		private String sac; //연령대
		private String cate; //카테고리
		private String gender; // 성별
		private String orderVal;
		private String nItem;  //신상
		
		public String getOrderVal() {
			return orderVal;
		}
		public void setOrderVal(String orderVal) {
			this.orderVal = orderVal;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getSw2() {
			return sw2;
		}
		public String getCate() {
			return cate;
		}
		public void setCate(String cate) {
			this.cate = cate;
		}
		public void setSw2(String sw2) {
			this.sw2 = sw2;
		}
		public String getSsp() {
			return ssp;
		}
		public void setSsp(String ssp) {
			this.ssp = ssp;
		}
		public String getSep() {
			return sep;
		}
		public void setSep(String sep) {
			this.sep = sep;
		}
		public String getSac() {
			return sac;
		}
		public void setSac(String sac) {
			this.sac = sac;
		}
		
		public String getnItem() {
			return nItem;
		}
		public void setnItem(String nItem) {
			this.nItem = nItem;
		}
		@Override
		public String toString() {
			return "ItemSearchVO [sw2=" + sw2 + ", ssp=" + ssp + ", sep=" + sep + ", sac=" + sac + ", cate=" + cate
					+ ", gender=" + gender + ", orderVal=" + orderVal + ", nItem=" + nItem + "]";
		}
		
}
