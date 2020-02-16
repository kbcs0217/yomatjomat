package com.yj.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BoardVo {
	private int page;
	private int pageSize;
	
	{
		page = 1;
		pageSize = 10;
	}
	
	public int getStartRow() {
		return (page-1)*pageSize;
	}
	public int getEndRow() {
		return page * pageSize;
	}
}
