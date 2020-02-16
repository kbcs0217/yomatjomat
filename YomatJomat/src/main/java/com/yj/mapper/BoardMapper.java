package com.yj.mapper;

import java.util.List;

import com.yj.domain.Board;
import com.yj.domain.BoardVo;

public interface BoardMapper {
	List<Board> selectPerPage(BoardVo boardVo);
	long selectCount();
	Board selectBySeq(long boardNo);
	void insert(Board board);
	void update(Board board);
	void delete(long boardNo);
}
