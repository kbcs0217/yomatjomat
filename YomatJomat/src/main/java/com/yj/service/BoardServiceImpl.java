package com.yj.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yj.domain.Board;
import com.yj.domain.BoardListResult;
import com.yj.domain.BoardVo;
import com.yj.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	private BoardMapper boardMapper;
	
	@Override
	public BoardListResult getBoardListResult(int page, int pageSize) {
		long totalCount = boardMapper.selectCount();
		System.out.println("#selectCount1: " + totalCount);
		BoardVo boardVo = new BoardVo(page, pageSize);
		List<Board> list = boardMapper.selectPerPage(boardVo);
		return new BoardListResult(page, pageSize, totalCount, list);
	}

	@Override
	public Board getBoard(long board_no) {
		return boardMapper.selectBySeq(board_no);
	}

	@Override
	public void write(Board board) {
		boardMapper.insert(board);
	}

	@Override
	public void edit(Board board) {
		boardMapper.update(board);
	}

	@Override
	public void remove(long board_no) {
		boardMapper.delete(board_no);
	}

}
