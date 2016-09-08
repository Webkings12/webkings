package com.webkings.app.style.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StyleServiceImpl implements StyleService{

	@Autowired
	private StyleDAO styleDao;
		
	@Override
	public List<StyleVO> selectStyle(String gender) {
		return styleDao.selectStyle(gender);
	}
	
}
