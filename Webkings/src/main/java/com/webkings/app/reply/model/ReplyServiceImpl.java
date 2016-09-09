package com.webkings.app.reply.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl  implements ReplyService{
	private static final Logger logger=
			LoggerFactory.getLogger(ReplyServiceImpl.class);
	@Autowired
	private ReplyDAO replyDao;
	
	@Override
	public int insertReply(ReplyViewVO vo) {
		return replyDao.insertReply(vo);
	}
	
	public List<ReplyViewVO> selectReply(int bNo){
		return replyDao.selectReply(bNo);
	}
	public int deleteReply(int rNo){
		return replyDao.deleteReply(rNo);
	}

	@Override
	@Transactional
	public int insertReply2(ReplyViewVO vo) {
		int cnt=replyDao.gbnReply(vo);
		logger.info("댓글2쓰기 업댓결과 cnt={}",cnt);
		
		cnt=replyDao.insertReply2(vo);
		logger.info("댓글2쓰기 글쓰기결과 cnt={}",cnt);
		return cnt;
	}
	
}
