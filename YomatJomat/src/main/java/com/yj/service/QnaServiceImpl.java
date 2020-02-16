package com.yj.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.yj.domain.Qna;
import com.yj.domain.QnaListResult;
import com.yj.domain.QnaVo;
import com.yj.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class QnaServiceImpl implements QnaService {
	private QnaMapper qnaMapper;

	@Override
	public QnaListResult getQnaListResult(int page, int pageSize) {
		long totalCount = qnaMapper.selectCount();
		System.out.println("#selectCount1: " + totalCount);
		QnaVo qnaVo = new QnaVo(page, pageSize);
		List<Qna> list = qnaMapper.selectPerPage(qnaVo);
		return new QnaListResult(page, pageSize, totalCount, list);
	}

	@Override
	public Qna getBoard(long qna_no) {
		return qnaMapper.selectBySeq(qna_no);
		
	}

	@Override
	public void write(Qna qna) {
		qnaMapper.insert(qna);

	}

	@Override
	public void edit(Qna qna) {
		qnaMapper.update(qna);

	}

	@Override
	public void remove(long qna_no) {
		qnaMapper.delete(qna_no);

	}

}
