package com.webkings.app.admin.controller;

import java.util.List;

import com.webkings.app.member.model.MemberVo;

public class AdminMemberListVO {
	private List<MemberVo> memberDelList;

	public List<MemberVo> getMemberDelList() {
		return memberDelList;
	}

	public void setMemberDelList(List<MemberVo> memberDelList) {
		this.memberDelList = memberDelList;
	}

	@Override
	public String toString() {
		return "AdminMemberListVO [memberDelList=" + memberDelList + "]";
	}
	
	
}
