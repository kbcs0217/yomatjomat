package com.yj.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yj.domain.Notice;
import com.yj.domain.NoticeImage;
import com.yj.domain.NoticeListResult;
import com.yj.service.FileUploadService;
import com.yj.service.NoticeImageService;
import com.yj.service.NoticeService;
import com.yj.util.FileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import com.yj.filesetting.Path;





@RequestMapping("/notice/*")
@Controller
@Log4j
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;
	private NoticeImageService noticeImageService;

	

	
	
	
	


	@RequestMapping(value = "/list")
	public ModelAndView list(Notice notice,HttpServletRequest request, HttpSession session) throws Exception {	
	
		String cpStr = request.getParameter("cp");
		//String psStr = request.getParameter("ps");
		
		//cp
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
			
			if(cp < 1) { //1페이지에서 이전 페이지로 넘어가려고 할 때
				cp = 1;
			}else {}
		}
		session.setAttribute("cp", cp);
		
		//ps
		int ps = 10;
		session.setAttribute("ps",ps);
		
		//ModelAndView
		NoticeListResult listResult = service.getNoticeListResult(cp, ps);
		
		ModelAndView mv = new ModelAndView("notice/list", "listResult", listResult);
	
		

	
		//new ModelAndView("file/list", "files", files);
		log.info("#listResult : " + listResult);
		if(listResult.getList().size()==0) {	//페이지에 게시물 지워졌을때 빈 page잡기
			if(cp > 1) {	
				return new ModelAndView("redirect:list?cp="+(cp-1));
			}else {
				return new ModelAndView("notice/list", "listResult", null);
			}
		}else {
			return mv;
		} 
	}
	

	
	
	@RequestMapping("/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response)throws Exception {
		Map<String, Object> resultMap = service.selectFileInfo(map);
		System.out.println(resultMap.get("OFNAME"));
		System.out.println("컨트롤러:"+resultMap);
		String storedFileName = (String)resultMap.get("SAVE_NAME");
		String originalFileName = (String)resultMap.get("OFNAME");
		
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\Users\\Kbc\\Desktop\\upload"+"/"+storedFileName));
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		
	}
	

	

	
	
	 @GetMapping("/write")
	   public String write() {
	      return "notice/write";
	   }
 
   
   @PostMapping("/write")
	public String write(Notice notice,MultipartHttpServletRequest request) throws Exception{
	   System.out.println("해당 값을 확인합니다:"+request.getFile("file"));
	   service.write(notice,request);
	   return "redirect:/notice/list";

	}
   
  
   
 
   
   

   

   
	@GetMapping("/content")
	public ModelAndView content(long notice_no) throws Exception {
		Notice notice = service.getNotice(notice_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/view");
		List<Map<String,Object>> fileList = service.selectFileList(notice.getNotice_no());
		System.out.println("FILELIST:"+fileList);
		System.out.println("content확인:"+notice);
		if(fileList.isEmpty()){
			mav.addObject("notice", notice);
		}else{
			mav.addObject("notice", notice);
			mav.addObject("file", fileList);
		}
		return mav;
	}
   
   @GetMapping("/update")
	public ModelAndView update(long notice_no,NoticeImage noticeImage) throws SQLException,Exception {
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("notice/update");
	   Notice notice = service.getNotice(notice_no);
	   List<Map<String,Object>> fileList = service.selectFileList(notice.getNotice_no());
	   System.out.println("FILELIST2:"+fileList);
	   System.out.println("글 정보:"+notice);
	   if(fileList.isEmpty()) {
		   mv.addObject("update",notice);
		   }else{
			   mv.addObject("file", fileList);
			   mv.addObject("update",notice);
			   }
		
		
		return mv;
	} 
   
   

	@PostMapping("/update")
	public String update(Notice notice,long notice_no, MultipartHttpServletRequest request,NoticeImage noticeImage) throws Exception{
		List<Map<String,Object>> fileList2= service.selectFileList2(notice.getNotice_no());
		System.out.println("update부분:"+fileList2);
		service.edit(notice,notice_no,request,fileList2);
		return "redirect:list";
	}
   
   @RequestMapping("/delete")
   public String remove(long notice_no,NoticeImage noticeImage,Notice notice) throws Exception {
	   notice = service.getNotice(notice_no);
	   
	   List<Map<String,Object>> fileList2 = service.selectFileList2(notice.getNotice_no());
	   System.out.println("파일을 지울때 널인지 아닌지 확인:"+fileList2);
	   if(fileList2.isEmpty()) {
		   service.normalremove(notice_no);
	   }else{
		   String string = fileList2.get(0).get("SAVE_NAME").toString();
		   service.remove(notice_no,string);
	   }
	   
	   return "redirect:list";
   }
   
   /*
   @GetMapping("/delete")
   public String remove(@RequestParam Map<String, Object> map,long notice_no)throws Exception {
	   Notice notice = service.getNotice(notice_no);
	   Map<String, Object> resultMap = service.selectFileInfo(map);
	   service.remove(notice,resultMap);	
	   return "redirect:list";
   }
   */
}