package com.yj.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
public class FileController {
	
	@RequestMapping("/notice/write")
	public ModelAndView write(@RequestParam MultipartFile file)throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/notice/list");
		log.info("#파일의 정보를 확인");
		log.info("#파일 이름:"+file.getName());
		log.info("#파일의 실제이름:"+file.getOriginalFilename());
		log.info("#파알의 실제크기:"+file.getSize());
		log.info("#파일의 유형:"+file.getContentType());
		
		return mav;

}
}
