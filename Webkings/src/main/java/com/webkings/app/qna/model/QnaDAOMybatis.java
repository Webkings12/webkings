package com.webkings.app.qna.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.webkings.app.common.SearchVO;
	
@Repository
public class QnaDAOMybatis extends SqlSessionDaoSupport implements QnaDAO{
	private String namespace="com.mybatis.mapper.oracle.qna";
	
	@Override
	public int insertQna(QnaVO qnaVo){
		return getSqlSession().insert(namespace+".insertQna",qnaVo);
	}
	
	public List<QnaViewVo> qnaSelectAll(SearchVO searchVo){
		return getSqlSession().selectList(namespace+".qnaSelectAll",searchVo);
	}
	
	public int selectTotalCount(SearchVO searchVo){
		return getSqlSession().selectOne(namespace+".selectTotalCount",searchVo);
	}
	
	public QnaViewVo selectByNo(int no){
		return getSqlSession().selectOne(namespace+".selectByNo",no);
	}
	public int deleteQna(int no){
		return getSqlSession().delete(namespace+".deleteQna",no);
	}
	public int selectMaxBNo(int qNo){
		return getSqlSession().selectOne(namespace+".selectMaxBNo",qNo);
	}

	@Override
	public int selectMinBNo(int qNo) {
		return getSqlSession().selectOne(namespace+".selectMinBNo",qNo);
	}

	@Override
	public int selectNext(int qNo) {
		return getSqlSession().selectOne(namespace+".selectNext",qNo);
	}

	@Override
	public int selectBefore(int qNo) {
		return getSqlSession().selectOne(namespace+".selectBefore",qNo);
	}
}
