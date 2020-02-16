package com.yj.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.yj.domain.NoticeImage;
import com.yj.mapper.NoticeImageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class NoticeImageServiceImpl implements NoticeImageService {

	
	private NoticeImageMapper noticeImageMapper;
	@Override
	public List<Map<String,Object>> getNoticeImage(long notice_no) {
		
		return noticeImageMapper.filename(notice_no);
	}


}
