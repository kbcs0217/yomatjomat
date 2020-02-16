package com.yj.controller;

import java.io.IOException;
import java.util.Random;

import javax.activation.CommandMap;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.yj.domain.Member;
import com.yj.mapper.MemberMapper;
import com.yj.oauth.Kakao_restapi;
import com.yj.oauth.NaverLoginBO;
import com.yj.service.MemberService;

import com.yj.service.UserLoginService;
import com.yj.service.UserMailSendService;
import com.yj.service.UserRedundantLoginService;
import com.yj.controller.KakaoController;

import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("member")
@Log4j
@AllArgsConstructor
public class MemberController {
	
	private NaverLoginBO naverLoginBO;
	
	
	
	
	private UserRedundantLoginService loginManager;
	private UserLoginService loginservice;
	private MemberService memberService;

	@Inject
	BCryptPasswordEncoder pwdEncoder;
	@Autowired
	private UserMailSendService mailsender;
	
	
	@GetMapping("join1")
	public String agree() throws Exception {
		return "member/join_01";
	}

	
	
	
	
	@GetMapping("/login")
	public String initLogin(HttpSession session, Model model) {

		// 세션만료
		//session.invalidate();
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		
		
		
		//System.out.println("네이버:"+naverAuthUrl);
		
		model.addAttribute("kakao_url",kakaoUrl);
		model.addAttribute("url",naverAuthUrl);
		//System.out.println("카카오:"+kakaoUrl);

		// 매장 리스트

		return "member/login";
	}
	

	
	@RequestMapping("/login")
	@ResponseBody
	public int userLoingPass(Member userVO, HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		// userLogin.jsp에서 아이디기억하기 name값(remember) 가져오기
		String user_check = request.getParameter("remember_userId");
		
		
		
		// 비밀번호 암호화
		String pwd = userVO.getPwd();
		//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// 암호화 확인
		System.out.println("user_pw : " + userVO.getPwd());
		log.info("#message:"+user_check);
		// 로그인 메서드
		int result = loginservice.userLogin_service(userVO, httpSession, user_check, response);

	

		

		return result;
	}
	
	@RequestMapping(value="kakaologin", produces="application/json")
	public ModelAndView kakaoLogin(@RequestParam("code") String code,
			HttpServletRequest request,HttpServletResponse response,HttpSession session,Model model) throws Exception{
		ModelAndView mav = new ModelAndView();
		JsonNode node = KakaoController.getAccessToken(code);
		JsonNode accessToken = node.get("access_token");
		
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		String kemail=null;
		String kname=null;
		String kgender=null;
		String kbirthday = null;
		String kage = null;
		String ktoken =  null;
		String kthumnailImage = null;
		String kprofileImage=null;
		
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		ktoken = accessToken.toString();
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kgender = kakao_account.path("gender").asText();
		kbirthday = kakao_account.path("birthday").asText();
		kage = kakao_account.path("age_range").asText();
		kage = kakao_account.path("age_range").toString();
		kthumnailImage = properties.path("thumbnail_image").asText();
		kprofileImage = properties.path("profile_image").asText();
		System.out.println(kthumnailImage);
		System.out.println(kprofileImage);
		
		
		model.addAttribute("userInfo",userInfo);
		session.setAttribute("userInfo",userInfo);
		session.setAttribute("token", ktoken);
		
		session.setAttribute("knickname", kname);
		session.setAttribute("kprofile", kprofileImage);
		session.setAttribute("thumbnail", kthumnailImage);
		
		
	
		
		
	
		mav.setViewName("redirect:/");
		return mav;
		
		
		
	}
	
	
	
	//네이버 로그인 성공시 callback 호출 메소드
	@RequestMapping(value="/callback")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws ParseException, IOException {
		System.out.println("여기는 콜백 페이지 입니다");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		
		//1.사용자 정보를 읽어온다.
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		/*apiresult json구조
		{"resultcode":"00",
			"message":"success",
			"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
*/
		
		//2.string 형식의 apiresult를 json형태로 바꿔줌
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3.데이터 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		
		
		if(nickname==null) {
			session.removeAttribute(nickname);
			return "member/join_01";
		}else {
			session.setAttribute("sessionId", nickname); //세션 만듬
			
			model.addAttribute("result",apiResult);
			return "main";
		}
		
		
			
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		Member userVO = (Member) session.getAttribute("userSession");
		String page = "redirect:/";

		if (userVO == null) { // admin이 로그아웃하면 adminLogin페이지로 보내줌
			page = "redirect:/";
		}
		
		else {
			System.out.println("??");
		}
		if(session.getAttribute("userSession")!=null) {
			session.removeAttribute("userSession");
			session.invalidate();
		}else if(session.getAttribute("knickname")!=null) {
			session.removeAttribute("knickname");
			session.invalidate();
		}else {
			session.invalidate();
		}
		
		//session.invalidate();
		return page;
	}
	
	@RequestMapping("/kakaologout")
	public String kakaologout(HttpSession session) {
		session.removeAttribute("knickname");
		session.removeAttribute("token");
		session.invalidate();
		return "redirect:/";
	}
	
	
	/*
	@RequestMapping(value="/kakaologout", produces = "application/json")
	public String kakaologout(HttpSession session,KakaoController kakao) {
		
		kakao.kakaoLogout(session.getAttribute("token").toString());
		session.removeAttribute("token");
		session.removeAttribute("knickname");
		return "redirect:/";
		
	}
	*/
	
	@RequestMapping("redundant")
	public ModelAndView beforelogout(HttpSession httpSession, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		String loginId = (String) httpSession.getAttribute("email");

		if (loginId != null) {
			// 기존의 접속(세션)을 끊는다.
			loginManager.removeSession(loginId);

			// 새로운 새션생성
			httpSession = request.getSession(true);
		}

		// 로그인시에 get방식으로 정보 받음
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		String user_check = request.getParameter("remember_userId");

		System.out.println("UserRedundantLoginController // email : " + email);
		System.out.println("UserRedundantLoginController // pwd : " + pwd);

		System.out.println("UserRedundantLoginController // user_check : " + user_check);

		int result = 0;

		Member member = new Member();
		member.setEmail(email);
		member.setPwd(pwdEncoder.encode(pwd)); // 비밀번호 암호화

		result = loginservice.userLogin_service(member, httpSession, user_check, response);

		if (result == 1) {
			System.out.println("[중복로그인] 기존로그인을 로그아웃후 나중로그인 실행");
			mav.setViewName("redirect:/");
		} else {
			System.out.println("[중복로그인] 실패");
			mav.setViewName("redirect:/");
		}
		loginManager.setSession(httpSession, loginId);

		return mav;
	}

	//1초 단위 ajax 세션확인 컨트롤러
	@RequestMapping(value = "redundantout", method = RequestMethod.GET)
	@ResponseBody
	public int redundantlogout(HttpServletRequest request) {

		int result = 0;

		HttpSession session = request.getSession(false);

		if (session == null) {
			result = -1;
		}

		//System.out.println("[세션 실시간 확인2] " + result);

		return result;
	}
	

	
	//아이디,비밀번호 찾기
	@GetMapping("userSearch")
	public String userIdSearchForm(Model model) {
		return "member/userSearch";
	}
	

	
	// 아이디 찾기
	@RequestMapping(value = "userSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("phone") String phone) {
		
		String result = loginservice.get_searchId(phone);
				
		//System.out.println("컨트롤러 확인" + result);
		
		return result;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "searchPassword", method = RequestMethod.GET)
	@ResponseBody
	public String passwordSearch(@RequestParam("email")String email,HttpServletRequest request) {
		//System.out.println("비밀번호 찾기 : Controller");
		//System.out.println(email);
		mailsender.mailSendWithPassword(email, request);
		
		return "member/userSearchPassword";
	}

	


	
	@RequestMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam(value="email") String email){
		log.info("#아이디 중복체크 "+email);
		int result=0;

		result = memberService.idCheck(email);
		return result;
	
		
	}

	@RequestMapping("nickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam(value="nickname", required=false) String nickname){
		log.info("#닉네임 중복체크 "+nickname);
		int result=0;
		result = memberService.nickCheck(nickname);
		return result;
	
		
	}
	
	
	@GetMapping("signup2")
	public String signup(Member signup) {
		return "member/signup2";
	}


	


	

	

	
	
	
	@PostMapping("signup2")
	public String signup(Member signup, HttpServletRequest request, HttpSession session){
		
		//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String inputpass = signup.getPwd();
		signup.setPwd(BCrypt.hashpw(inputpass, BCrypt.gensalt(10)));
		memberService.register(signup);
		mailsender.mailSendWithUserKey(signup.getEmail(), signup.getNickname(), request);

		return "redirect:/member/login";
	}
	
	@GetMapping("infocheck")
	public String passchk() {
		
		return "member/passchk";
	}
	
	@RequestMapping("infocheck")
	@ResponseBody
	public int passchk(Member passchk,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		session.getAttribute("email");
		
		int result = loginservice.usercheck_service(passchk, session,response);
		return result;
	}
	
	//회원정보 변경 컨트롤러
	@GetMapping("update")
	public ModelAndView update(Member update,HttpSession session,HttpServletRequest request) {
		System.out.println(session.getAttribute("email"));
		ModelAndView upd = new ModelAndView();
		upd.setViewName("/member/update");
		upd.addObject("update",update);
		return upd;
	}
	
	@PostMapping("update")
	public String update(@RequestParam("nickname") String nickname,@RequestParam("phone") String phone,HttpServletRequest request,HttpSession session) {
		System.out.println(session.getAttribute("email"));
		String email = (String) session.getAttribute("email");
		memberService.update(email,nickname,phone);
		session.invalidate();
		
		return "redirect:/member/login";
	}
	

	
	@GetMapping("pwdupdate")
	public String pwdupdate() {
		return "member/pwdupdate";
	}
	
	@PostMapping("pwdupdate")
	public String pwdupdate(String currenpasswd,HttpSession session,Member user) throws Exception{
		String email = (String) session.getAttribute("email");
		currenpasswd = user.getPwd();
		System.out.println("email:"+email+"password:"+currenpasswd);
		user.setEmail(email);
		user.setPwd(BCrypt.hashpw(currenpasswd, BCrypt.gensalt(10)));
		

		
		memberService.pwdUpdate(user);
		return "member/login";
		
	}
	
	
	///////회원탈퇴부분 관리자랑 겹쳐서 안구현/////
	
	@PostMapping("memberdelete")
	public String memberdelete() {
		return null;
	}
//////////////////	
	

	
	
	// e-mail 인증 컨트롤러
		@RequestMapping(value = "key_alter", method = RequestMethod.GET)
		public String key_alterConfirm(@RequestParam("email") String email, @RequestParam("user_key") String key) {
			log.info("#key넘어온거 확인" + key);
			mailsender.alter_userKey_service(email, key); // mailsender의 경우 @Autowired

			return "/member/userRegSuccess";
		}
		
		
	
		

		
		
	}
		

	
	
	

	
	
	

	

	
	

	




