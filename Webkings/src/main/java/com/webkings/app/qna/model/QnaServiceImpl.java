package com.webkings.app.qna.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webkings.app.common.SearchVO;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qnaDao;
	

	public int insertQna(QnaVO qnaVo){
		return qnaDao.insertQna(qnaVo);
	}
	public List<QnaViewVo> qnaSelectAll(SearchVO searchVo){
		return qnaDao.qnaSelectAll(searchVo);
	}
	public int selectTotalCount(SearchVO searchVo){
		return qnaDao.selectTotalCount(searchVo);
	}
	public QnaViewVo selectByNo(int no){
		return qnaDao.selectByNo(no);
	}
	public int deleteQna(int no){
		return qnaDao.deleteQna(no);
	}
}
