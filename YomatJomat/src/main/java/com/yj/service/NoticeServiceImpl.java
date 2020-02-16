package com.yj.service;


import java.io.File;
import java.io.FileNotFoundException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yj.domain.Notice;
import com.yj.domain.NoticeImage;
import com.yj.domain.NoticeListResult;
import com.yj.domain.NoticeVo;
import com.yj.filesetting.Path;
import com.yj.mapper.NoticeImageMapper;
import com.yj.mapper.NoticeMapper;
import com.yj.util.FileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class NoticeServiceImpl implements NoticeService {
	private NoticeMapper noticeMapper;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	
	

	
	


	@Override
	public NoticeListResult getNoticeListResult(int page, int pagesize) {
		long totalCount = noticeMapper.selectCount();
		System.out.println("#selectCount1: " + totalCount);
		NoticeVo noticeVo = new NoticeVo(page, pagesize);
		List<Notice> list = noticeMapper.selectPerPage(noticeVo);
		return new NoticeListResult(page, pagesize, totalCount, list);
		
		
	}

	@Override
	public Notice getNotice(long notice_no) {
		return noticeMapper.selectBySeq(notice_no);
	}
	
	


	@Override
	public void write(Notice notice,MultipartHttpServletRequest request) throws Exception {
		System.out.println("#notice:"+notice);
		
		if(request.getFile("file")!=null) {
			noticeMapper.write(notice);
			List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(notice, request);
			System.out.println("filelist:"+list);
			long size = list.size();
			for(int i=0;i<size; i++) {
				noticeMapper.insertFile(list.get(i));
				}
			}else {
				noticeMapper.write(notice);
			}
		
		
	}

	@Override
	public Map<String,Object> selectFileInfo(Map<String,Object> map) throws Exception{
		return noticeMapper.selectFileInfo(map);
	}
	
	
	

	@Override
	public void edit(Notice notice, long notice_no, MultipartHttpServletRequest request, List<Map<String, Object>> fileList2)throws Exception {
		if(request.getFile("file")!=null&fileList2.isEmpty()) {//파일첨부안한 게시글에 수정시 파일첨부할때
			noticeMapper.update(notice);
			List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(notice, request);
			//List<Map<String,Object>> elist = fileUtils.parseUpdateFileInfo(notice,request);
		
			
			long size = list.size();
			System.out.println(size);
			for(int i=0;i<size; i++) {
				noticeMapper.insertFile(list.get(i));
			}
		}else if(request.getFile("file")==null&fileList2.isEmpty()){
			noticeMapper.update(notice);
		}else{
			String upname = fileList2.get(0).get("SAVE_NAME").toString();
			noticeMapper.update(notice);
			String path = Path.FILE_STORE +"/"+upname;
			File file = new File(path);
			if(file.getName()!=null&&file.exists()==true) {
				file.delete();
				System.out.println("파일수정용 삭제 성공");
			}else if(file.getName()==null&&file.exists()==false){
				System.out.println("파일삭제 실패");
				}else{
					System.out.println("파일이 없는듯요");
					return;
					}
			
			List<Map<String,Object>> elist = fileUtils.parseUpdateFileInfo(notice,request);
		
			
			long size = elist.size();
			System.out.println(size);
			for(int i=0;i<size; i++) {
				noticeMapper.updateFile(elist.get(i));
			}
			 
			
		}	
		
		
		
	
	}
	

	
	


	
	@Override
	public void remove(long notice_no,String string) throws Exception,IllegalStateException,FileNotFoundException {
		System.out.println(string);
		noticeMapper.deleteFile(notice_no);
		noticeMapper.delete(notice_no);		
		
		String path = Path.FILE_STORE +"/"+string;
		File file = new File(path);
		if(file.exists()==true) {
			file.delete();
			System.out.println("파일삭제 성공");
		}else if(file.exists()==false){
			System.out.println("파일삭제 실패");
		}
		else{
			System.out.println("파일이 없는듯요");
		
		}
		//long size = list.size();
		
	}





		
	
		
		
		
	
	
	

	@Override
	public List<Map<String,Object>> selectFileList(long notice_no) throws Exception{
		return noticeMapper.selectFileList(notice_no);
	}
	@Override
	public List<Map<String,Object>> selectFileList2(long notice_no) throws Exception{
		return noticeMapper.selectFileList2(notice_no);
	}
	
	@Override
	public List<Map<String,Object>> selectFileList3(long notice_no) throws Exception{
		return noticeMapper.selectFileList3(notice_no);
	}

	@Override
	public void normalremove(long notice_no) {
		noticeMapper.delete(notice_no);
		
	}

	@Override
	public void normalwrite(Notice notice) {
		// TODO Auto-generated method stub
		
	}


	


}
