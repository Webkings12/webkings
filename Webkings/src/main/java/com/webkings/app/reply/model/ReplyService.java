package com.webkings.app.reply.model;

import java.util.List;

public interface ReplyService {
	public int insertReply(ReplyViewVO vo);
	public List<ReplyViewVO> selectReply(int bNo);
	public int deleteReply(int rNo);
	public int insertReply2(ReplyViewVO vo);
}
