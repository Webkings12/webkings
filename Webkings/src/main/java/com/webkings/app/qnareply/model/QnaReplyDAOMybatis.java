package com.webkings.app.qnareply.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class QnaReplyDAOMybatis extends SqlSessionDaoSupport implements QnaReplyDAO {
	
	private String namespace="com.mybatis.mapper.oracle.qnareply";
	
	public int insertReply(QnaReplyViewVO vo){
		return getSqlSession().insert(namespace+".insertReply",vo);
	}
	
	public List<QnaReplyViewVO> selectReply(int bNo){
		return getSqlSession().selectList(namespace+".selectReply",bNo);
	}
	
	public int deleteReply(int rNo){
		return getSqlSession().delete(namespace+".deleteReply",rNo);
	}

	@Override
	public int gbnReply(QnaReplyViewVO vo) {
		return getSqlSession().update(namespace+".gbnReply",vo);
	}

	@Override
	public int insertReply2(QnaReplyViewVO vo) {
		return getSqlSession().insert(namespace+".insertReply2",vo);
	}
}
