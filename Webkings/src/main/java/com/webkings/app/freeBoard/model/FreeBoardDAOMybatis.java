package com.webkings.app.freeBoard.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.webkings.app.common.SearchVO;

@Repository
public class FreeBoardDAOMybatis extends SqlSessionDaoSupport implements FreeBoardDAO {
	private String namespace="com.mybatis.mapper.oracle.freeBoard";
	
	public int insertFreeBoard(FreeBoardVO freeBoardVo){
		return getSqlSession().insert(namespace+".insertFreeBoard",freeBoardVo);
	}
	
	public List<BoardViewVO> freeBoardselectAll(SearchVO searchVo){
		return getSqlSession().selectList(namespace+".freeBoardselectAll",searchVo);
	}
	
	public int selectTotalRecord(SearchVO searchVo){
		return getSqlSession().selectOne(namespace+".selectTotalRecord",searchVo);
	}
	
	public int updateCount(int no){
		return getSqlSession().update(namespace+".updateCount",no);
	}
	
	public BoardViewVO selectByNo(int no){
		return getSqlSession().selectOne(namespace+".selectByNo",no);
	}
	
	public int updateBoard(FreeBoardVO freeBoardVo){
		return getSqlSession().update(namespace+".updateByNo",freeBoardVo);
	}
	
	public int deleteBoard(int bNo){
		return getSqlSession().delete(namespace+".deleteBoard",bNo);
	}
	
	public int selectMaxBNo(int bNo){
		return getSqlSession().selectOne(namespace+".selectMaxBNo",bNo);
	}

	@Override
	public int selectMinBNo(int bNo) {
		return getSqlSession().selectOne(namespace+".selectMinBNo",bNo);
	}

	@Override
	public int selectNext(int bNo) {
		return getSqlSession().selectOne(namespace+".selectNext",bNo);
	}

	@Override
	public int selectBefore(int bNo) {
		return getSqlSession().selectOne(namespace+".selectBefore",bNo);
	}
}
