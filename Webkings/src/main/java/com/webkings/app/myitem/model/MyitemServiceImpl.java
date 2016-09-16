package com.webkings.app.myitem.model;

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

}
