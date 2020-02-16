package com.yj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yj.domain.Qna;
import com.yj.domain.QnaListResult;
import com.yj.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/help/*")
@Controller
@Log4j
@AllArgsConstructor
public class HelpController {
	private QnaService qnaservice;
	
   @GetMapping(value = "/list")
   public ModelAndView list(Qna qna,HttpServletRequest request,HttpSession session) {
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
		QnaListResult listResult = qnaservice.getQnaListResult(cp, ps);
		
		ModelAndView mv = new ModelAndView("help/list", "listResult", listResult);
	
		

	
		//new ModelAndView("file/list", "files", files);
		log.info("#listResult : " + listResult);
		if(listResult.getList().size()==0) {	//페이지에 게시물 지워졌을때 빈 page잡기
			if(cp > 1) {	
				return new ModelAndView("redirect:list?cp="+(cp-1));
			}else {
				return new ModelAndView("help/list", "listResult", null);
			}
		}else {
			return mv;
		} 
	}
   @GetMapping(value="/write")
   public String write() {
	   return "help/write";
   }
   
   @PostMapping(value="/write")
   public String write(Qna qna,HttpServletRequest request,HttpSession session) {
	   qnaservice.write(qna);
	   return "redirect:/help/list";
   }
}