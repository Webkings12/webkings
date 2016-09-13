package com.webkings.app.qnareply.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class QnaReplyServiceImpl  implements QnaReplyService{
	private static final Logger logger=
			LoggerFactory.getLogger(QnaReplyServiceImpl.class);
	@Autowired
	private QnaReplyDAO qnaReplyDao;
	
	@Override
	public int insertReply(QnaReplyViewVO vo) {
		return qnaReplyDao.insertReply(vo);
	}
	
	public List<QnaReplyViewVO> selectReply(int bNo){
		return qnaReplyDao.selectReply(bNo);
	}
	public int deleteReply(int rNo){
		return qnaReplyDao.deleteReply(rNo);
	}

	@Override
	@Transactional
	public int insertReply2(QnaReplyViewVO vo) {
		int cnt=qnaReplyDao.gbnReply(vo);
		logger.info("댓글2쓰기 업댓결과 cnt={}",cnt);
		
		cnt=qnaReplyDao.insertReply2(vo);
		logger.info("댓글2쓰기 글쓰기결과 cnt={}",cnt);
		return cnt;
	}
}
