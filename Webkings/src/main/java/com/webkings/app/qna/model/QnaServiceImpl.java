package com.webkings.app.qna.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webkings.app.common.SearchVO;
import com.webkings.app.freeBoard.model.BoardViewVO;

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
	
	public int selectNext(int qNo) {
		int nextNo=qnaDao.selectMaxBNo(qNo);
		if(nextNo==qNo){
			return nextNo;
		}else{
			return qnaDao.selectNext(qNo);
		}
	}

	@Override
	public int selectBefore(int qNo) {
		int before=qnaDao.selectMinBNo(qNo);
		if(before==qNo){
			return before;
		}else{
			return qnaDao.selectBefore(qNo);
		}
	}
	
	public int updateQna(QnaVO vo){
		return qnaDao.updateQna(vo);
	}
	
	@Transactional
	public int deleteQna(List<QnaViewVo> listVo){
		int cnt=0;
		try{
			for(QnaViewVo vo: listVo){
				int qNo=vo.getqNo();
				if(qNo!=0){
					cnt=qnaDao.deleteQna(qNo);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt; 
	}
	
}
