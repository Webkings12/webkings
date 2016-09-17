package com.webkings.app.myitem.model;

import java.util.List;
import java.util.Map;

public interface MyitemService {
	public int insertMyitem(MyitemVO vo);
	public int selectINO(MyitemVO vo);
	public List<MyItemviewVO> selectMiTEMview(int mNo);
}
