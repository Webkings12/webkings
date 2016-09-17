package com.webkings.app.myitem.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyitemServiceImpl implements MyitemService{

	@Autowired
	private MyitemDAO myitemDAO;
	

	@Override
	public int selectINO(MyitemVO vo) {
		return myitemDAO.selectINO(vo);
	}

	@Override
	public int insertMyitem(MyitemVO vo) {
		return myitemDAO.insertMyitem(vo);
	}

	@Override
	public List<MyItemviewVO> selectMiTEMview(int mNo) {
		return myitemDAO.selectMiTEMview(mNo);
	}

}
