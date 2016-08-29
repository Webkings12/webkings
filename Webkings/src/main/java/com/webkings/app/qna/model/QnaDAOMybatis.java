package com.webkings.app.qna.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
	
@Repository
public class QnaDAOMybatis extends SqlSessionDaoSupport implements QnaDAO{
	private String namespace="com.mybatis.mapper.oracle.qna";
	
	public int insertQna(QnaVO qnaVo){
		return getSqlSession().insert(namespace+".inertQna",qnaVo);
	}
	
}
