package com.yj.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor

public class QnaListResult { 
	private int page; 
	private int pageSize; 
	private long totalCount; 
	private List<Qna> list;  
	private long totalPageCount; 
	
	public QnaListResult(int page, int pageSize, long totalCount, List<Qna> list) {
		this.page = page; 
		this.pageSize = pageSize; 
		this.totalCount = totalCount; 
		this.list = list;  
		this.totalPageCount = calTotalPageCount(); 
		System.out.println("#totalPageCount : "+totalPageCount); 
	}
	private long calTotalPageCount() {
		long tpc = 1;
		//long tpc = totalCount/pageSize;
		if(totalCount/pageSize != 0) tpc++;
		return tpc;
	}
} 
