package com.webkings.app.qna.model;

import java.util.List;

import com.webkings.app.common.SearchVO;

public interface QnaDAO {
	public int insertQna(QnaVO qnaVo);
	public List<QnaViewVo> qnaSelectAll(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public QnaViewVo selectByNo(int no);
	public int deleteQna(int no);
	public int selectMaxBNo(int qNo);
	public int selectMinBNo(int qNo);
	public int selectNext(int qNo);
	public int selectBefore(int qNo);
}
