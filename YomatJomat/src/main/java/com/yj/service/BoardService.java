package com.yj.service;

import com.yj.domain.Board;
import com.yj.domain.BoardListResult;

public interface BoardService {
	BoardListResult getBoardListResult(int page, int pageSize);
	Board getBoard(long board_no);
	
	void write(Board board);
	void edit(Board board);
	void remove(long board_no);
}
