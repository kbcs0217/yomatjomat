package com.yj.mapper;


import java.util.List;
import java.util.Map;



public interface NoticeImageMapper {
	List<Map<String, Object>> filename(long notice_no);
	long filenumber(long notice_no);
}

