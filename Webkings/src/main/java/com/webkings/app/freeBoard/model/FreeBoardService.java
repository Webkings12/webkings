package com.webkings.app.freeBoard.model;

import java.util.List;


import com.webkings.app.common.SearchVO;

public interface FreeBoardService {
	public int insertFreeBoard(FreeBoardVO freeBoardVo);
	public List<BoardViewVO> freeBoardselectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public int updateCount(int no);
	public BoardViewVO selectByNo(int no);
	public int updateBoard(FreeBoardVO freeBoardVo);
	public int deleteBoard(int bNo);
	public int selectNext(int bNo);
	public int selectBefore(int bNo);
	public int deleteboard(List<BoardViewVO> listVo);
	
	
}
