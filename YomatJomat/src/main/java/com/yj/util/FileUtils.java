package com.yj.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
 
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yj.domain.Notice;
 
@Component("fileUtils")
public class FileUtils {
	public static final String filePath = "C:\\Users\\Kbc\\Desktop\\upload"; // 파일이 저장될 위치
	
	public List<Map<String, Object>> parseInsertFileInfo(Notice notice, 
			MultipartHttpServletRequest request) throws Exception{
		
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		System.out.println(request.getFileNames());
		Iterator<String> iterator = request.getFileNames();
		
		MultipartFile multipartFile = null;
		String ofname = null;
		String originalFileExtension = null;
		String save_name = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		long notice_no = notice.getNotice_no();
		System.out.println(notice_no);
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
	     
	       
		
		while(iterator.hasNext()) {
			multipartFile = request.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				ofname = multipartFile.getOriginalFilename();
				originalFileExtension = ofname.substring(ofname.lastIndexOf("."));
				save_name = getRandomString() + originalFileExtension;
				
				file = new File(filePath +"/"+ save_name);
				System.out.println("최종관문:"+notice_no);
				System.out.println("최종:"+ofname);
				System.out.println("최종:"+save_name);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("NOTICE_NO", notice_no);
				listMap.put("OFNAME", ofname);
				listMap.put("SAVE_NAME", save_name);
				System.out.println("listmap:"+listMap);
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	
	public List<Map<String, Object>> parseUpdateFileInfo(Notice notice, 
			MultipartHttpServletRequest request) throws Exception{
		
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		System.out.println("업데이트 과정으로 들어왓는지 확인합니다.:"+request.getFileNames());
		Iterator<String> iterator = request.getFileNames();
		
		MultipartFile multipartFile = null;
		String ofname = null;
		String originalFileExtension = null;
		String save_name = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		
		long notice_no = notice.getNotice_no();
		System.out.println(notice_no);
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
	     
	       
		
		while(iterator.hasNext()) {
			multipartFile = request.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				ofname = multipartFile.getOriginalFilename();
				originalFileExtension = ofname.substring(ofname.lastIndexOf("."));
				save_name = getRandomString() + originalFileExtension;
				
				file = new File(filePath +"/"+ save_name);
				System.out.println("업데이트최종관문:"+notice_no);
				System.out.println("업데이트최종:"+ofname);
				System.out.println("업데이트최종:"+save_name);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("NOTICE_NO", notice_no);
				listMap.put("OFNAME", ofname);
				listMap.put("SAVE_NAME", save_name);
				System.out.println("listmap:"+listMap);
				list.add(listMap);
			
			}
		}
	
		return list;
	}
			
				
		
		
	
		
	
/*
	public List<Map<String, Object>> parseUpdateFileInfo(Notice notice, String[] files, String[] fileNames,
			MultipartHttpServletRequest request) throws Exception {
		Iterator<String> iterator = request.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		long notice_no = notice.getNotice_no();
		while(iterator.hasNext()) {
			multipartFile = request.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString()+originalFileExtension;
				multipartFile.transferTo(new File(filePath+storedFileName));
				listMap = new HashMap<String,Object>();
				listMap.put("NOTICE_NO", notice_no);
				listMap.put("OFNAME", originalFileName);
				listMap.put("SAVE_NAME", storedFileName);
				list.add(listMap);
			}
		}
		if(files !=null &&fileNames !=null) {
			for(int i=0; i<fileNames.length; i++) {
				listMap = new HashMap<String,Object>();
				listMap.put("NFILE_NO", files[i]);
				list.add(listMap);
			}
		}
		
		return list;
	}
	*/
}
