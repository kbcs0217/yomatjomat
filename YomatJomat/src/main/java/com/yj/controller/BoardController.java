package com.yj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yj.domain.BoardListResult;
import com.yj.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import com.yj.domain.Board;

@RequestMapping("/board/*")
@Controller
@Log4j
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
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
		BoardListResult listResult = service.getBoardListResult(cp, ps);
		ModelAndView mv = new ModelAndView("board/list", "listResult", listResult);
		log.info("#listResult : " + listResult);
		if(listResult.getList().size()==0) {	//페이지에 게시물 지워졌을때 빈 page잡기
			if(cp > 1) {	
				return new ModelAndView("redirect:list?cp="+(cp-1));
			}else {
				return new ModelAndView("board/list", "listResult", null);
			}
		}else {
			return mv;
		} 
	}
	
	
	@GetMapping("/content")
	public String content() {
		return "board/view";
	} 
	

	
	@RequestMapping("/write")
	public String write() {
		return "board/write";
	} 
	@PostMapping("/write")
	public String write(Board board){
		service.write(board);
		return "redirect:list.do";
	}
}
