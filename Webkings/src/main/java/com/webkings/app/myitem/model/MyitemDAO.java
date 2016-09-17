package com.webkings.app.myitem.model;

import java.util.List;
import java.util.Map;

public interface MyitemDAO {
	public int insertMyitem(MyitemVO vo);
	public int selectINO(int mNo);
	public List<MyItemviewVO> selectMiTEMview(int mNo);
}
