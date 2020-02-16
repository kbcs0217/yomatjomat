package com.yj.service;

import com.yj.domain.Qna;
import com.yj.domain.QnaListResult;


public interface QnaService {
	QnaListResult getQnaListResult(int page, int pageSize);
	Qna getBoard(long qna_no);
	
	void write(Qna qna);
	void edit(Qna qna);
	void remove(long qna_no);
}

