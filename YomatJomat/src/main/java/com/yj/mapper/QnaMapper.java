package com.yj.mapper;

import java.util.List;

import com.yj.domain.Board;
import com.yj.domain.BoardVo;
import com.yj.domain.Qna;
import com.yj.domain.QnaVo;

public interface QnaMapper {
	List<Qna> selectPerPage(QnaVo qnaVo);
	long selectCount();
	Qna selectBySeq(long qnaNo);
	void insert(Qna qna);
	void update(Qna qna);
	void delete(long qnaNo);
}
