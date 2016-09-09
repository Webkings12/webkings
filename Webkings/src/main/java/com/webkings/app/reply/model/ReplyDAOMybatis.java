package com.webkings.app.reply.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOMybatis extends SqlSessionDaoSupport implements ReplyDAO{
	private String namespace="com.mybatis.mapper.oracle.reply";
	
	public int insertReply(ReplyViewVO vo){
		return getSqlSession().insert(namespace+".insertReply",vo);
	}
	
	public List<ReplyViewVO> selectReply(int bNo){
		return getSqlSession().selectList(namespace+".selectReply",bNo);
	}
	
	public int deleteReply(int rNo){
		return getSqlSession().delete(namespace+".deleteReply",rNo);
	}

	@Override
	public int gbnReply(ReplyViewVO vo) {
		return getSqlSession().update(namespace+".gbnReply",vo);
	}

	@Override
	public int insertReply2(ReplyViewVO vo) {
		return getSqlSession().insert(namespace+".insertReply2",vo);
	}
	
}
