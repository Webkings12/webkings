package com.webkings.app.freeBoard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
