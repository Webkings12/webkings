package com.webkings.app.myitem.model;

import java.util.List;
import java.util.Map;

public interface MyitemService {
	public int insertMyitem(Map<String, Object> map);
	public List<MyitemVO> selectMyitem(int mNo);
	public int selectINO(int mNo);
}
