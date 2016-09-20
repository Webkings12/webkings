package com.webkings.app.freeBoard.model;

import java.util.List;

public class FreeboardListVO {
	private List<BoardViewVO> boardItem;

	public List<BoardViewVO> getBoardItem() {
		return boardItem;
	}

	public void setBoardItem(List<BoardViewVO> boardItem) {
		this.boardItem = boardItem;
	}

	@Override
	public String toString() {
		return "FreeboardListVO [boardItem=" + boardItem + "]";
	}
	
	
	
}
