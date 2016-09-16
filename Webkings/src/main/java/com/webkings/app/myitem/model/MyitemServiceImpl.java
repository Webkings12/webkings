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
	public int insertMyitem(Map<String, Object> map) {
		return myitemDAO.insertMyitem(map);
	}

	@Override
	public List<MyitemVO> selectMyitem(int mNo) {
		return myitemDAO.selectMyitem(mNo);
	}

	@Override
	public int selectINO(int mNo) {
		return myitemDAO.selectINO(mNo);
	}

}
