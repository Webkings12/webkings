package com.webkings.app.qna.model;

import java.util.List;

public class QnaListVO {
	List<QnaViewVo> qnaList;

	public List<QnaViewVo> getQnaList() {
		return qnaList;
	}

	public void setQnaList(List<QnaViewVo> qnaList) {
		this.qnaList = qnaList;
	}

	@Override
	public String toString() {
		return "QnaListVO [qnaList=" + qnaList + "]";
	}
	
	
}
