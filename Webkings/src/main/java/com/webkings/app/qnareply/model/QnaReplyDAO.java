package com.webkings.app.qnareply.model;

import java.util.List;


public interface QnaReplyDAO {
	public int insertReply(QnaReplyViewVO vo);
	public List<QnaReplyViewVO> selectReply(int bNo);
	public int deleteReply(int rNo);
	
	public int gbnReply(QnaReplyViewVO vo);
	public int insertReply2(QnaReplyViewVO vo);
}
