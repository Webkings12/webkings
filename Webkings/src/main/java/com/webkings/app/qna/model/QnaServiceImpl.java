package com.webkings.app.qna.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qnaDao;
	
	@Override
	public int insertQna(QnaVO qnaVo) {
		int cnt = 5;
		return cnt;
	}
/*	
	public int insertQna(QnaVO qnaVo){
		return qnaDao.insertQna(qnaVo);
	}*/
}
