package com.yj.mapper;

import java.util.List;
import java.util.Map;

import com.yj.domain.Board;
import com.yj.domain.BoardVo;
import com.yj.domain.Notice;

import com.yj.domain.NoticeVo;
import com.yj.domain.Qna;

public interface NoticeMapper {
	List<Notice> selectPerPage(NoticeVo noticeVo);
	long selectCount();
	Notice selectBySeq(long notice_no);
	void update(Notice notice);
	void write(Notice notice);
	void insertFile(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectFileList(long notice_no) throws Exception;
	List<Map<String, Object>> selectFileList2(long notice_no) throws Exception;
	List<Map<String, Object>> selectFileList3(long notice_no) throws Exception;
	public Map<String,Object> selectFileInfo(Map<String,Object> map)throws Exception;
	public void updateFile(Map<String, Object> map) throws Exception;
	public void deleteFile(long notice_no);

	void delete(long notice_no);

}

