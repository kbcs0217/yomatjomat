package com.yj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/mypage/*")
@Controller
@Log4j
@AllArgsConstructor
public class MypageController {
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String index() {
		return "mypage/list";
	}
	
	@GetMapping("/scrap")
	public String scrap() {
		return "mypage/scrap";
	}
	
	@GetMapping("/reply")
	public String reply() {
		return "mypage/list_r";
	}
	
	@GetMapping("/talk")
	public String talk() {
		return "mypage/list_t";
	}
	
	@GetMapping("/sView")
	public String scrapView() {
		return "mypage/scrap_v";
	}
	
	@GetMapping("/following")
	public String following() {
		return "mypage/following";
	}
	
	@GetMapping("/modify")
	public String modify() {
		return "mypage/modify";
	}
	@GetMapping("/pop_mdfy")
	public String popUp() {
		return "mypage/pop_mdfy";
	}
}
 