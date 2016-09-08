package com.webkings.app.style.model;

import java.util.List;

public interface StyleDAO {
	public List<StyleVO> selectStyle(String gender);
}
