package com.yj.service;


import java.util.List;
import java.util.Map;

import com.yj.domain.NoticeImage;

public interface NoticeImageService {
	List<Map<String,Object>> getNoticeImage(long notice_no);

}
