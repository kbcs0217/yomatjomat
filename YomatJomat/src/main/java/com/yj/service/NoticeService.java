package com.yj.service;




import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.codec.multipart.MultipartHttpMessageReader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yj.domain.Notice;
import com.yj.domain.NoticeImage;
import com.yj.domain.NoticeListResult;

public interface NoticeService {
	NoticeListResult getNoticeListResult(int page,int pagesize);
	Notice getNotice(long notice_no);
	public void edit(Notice notice, long notice_no, MultipartHttpServletRequest request, List<Map<String, Object>> fileList2) throws Exception;
	//void remove(Notice notice, Map<String, Object> resultMap) throws Exception;
	void normalwrite(Notice notice);
	void write(Notice notice, MultipartHttpServletRequest request) throws Exception;
	List<Map<String,Object>> selectFileList(long notice_no) throws Exception;
	List<Map<String,Object>> selectFileList2(long notice_no) throws Exception;
	List<Map<String,Object>> selectFileList3(long notice_no) throws Exception;
	public Map<String,Object> selectFileInfo(Map<String, Object> map) throws Exception;
	void remove(long notice_no, String string)throws Exception;
	void normalremove(long notice_no);
	



	
}
