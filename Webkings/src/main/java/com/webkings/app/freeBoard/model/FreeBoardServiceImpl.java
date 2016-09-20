package com.webkings.app.freeBoard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webkings.app.common.SearchVO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	@Autowired
	FreeBoardDAO fbDao;
	
	public int insertFreeBoard(FreeBoardVO freeBoardVo){
		return fbDao.insertFreeBoard(freeBoardVo);
	}
	
	public List<BoardViewVO> freeBoardselectAll(SearchVO searchVo){
		return fbDao.freeBoardselectAll(searchVo);
	}
	public int selectTotalRecord(SearchVO searchVo){
		return fbDao.selectTotalRecord(searchVo);
	}
	public int updateCount(int no){
		return fbDao.updateCount(no);
	}
	public BoardViewVO selectByNo(int no){
		return fbDao.selectByNo(no);
	}
	public int updateBoard(FreeBoardVO freeBoardVo){
		return fbDao.updateBoard(freeBoardVo);
	}

	@Override
	public int deleteBoard(int bNo) {
		return fbDao.deleteBoard(bNo);
	}

	@Override
	public int selectNext(int bNo) {
		int nextNo=fbDao.selectMaxBNo(bNo);
		if(nextNo==bNo){
			return nextNo;
		}else{
			return fbDao.selectNext(bNo);
		}
	}

	@Override
	public int selectBefore(int bNo) {
		int before=fbDao.selectMinBNo(bNo);
		if(before==bNo){
			return before;
		}else{
			return fbDao.selectBefore(bNo);
		}
	}
	
	@Transactional
	public int deleteboard(List<BoardViewVO> listVo){
		int cnt=0;
		try{
			for(BoardViewVO vo: listVo){
				int productNo=vo.getbNo();
				if(productNo!=0){
					cnt=fbDao.deleteBoard(vo.getbNo());
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt; 
	}
}
