package com.yj.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCrypt;

import org.springframework.stereotype.Service;

import com.yj.domain.Member;
import com.yj.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class UserLoginService {
	//Member가 vo역할
	
	private UserRedundantLoginService loginManager;
	private MemberMapper memberMapper;
	
	
	public String get_searchId(String phone) {

		
		
		System.out.println("서비스 확인1" + memberMapper.searchId(phone));
		String result = "";

		try {
			result = memberMapper.searchId(phone);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("서비스 확인2 :" + memberMapper);
		return result;
	}
	
	



	

	public int userLogin_service(Member userVO, HttpSession httpSession, String user_check,
			HttpServletResponse response) {

		System.out.println("UserLoginService // 로그인 객체 확인 userVO : " + userVO);
		String email = userVO.getEmail();
		String pwd = userVO.getPwd();

		
		Member vo = memberMapper.loginUser(email);


		System.out.println("UserLoginService // 로그인 객체 확인 vo : " + vo);

		// 로그인 결과값
		int result = 0;
		
		System.out.println("확인뇽:"+email+"이것도확인:"+pwd);



		// 회원 정보가 없을 시
		if (vo == null) {
			result = 0;
			return result;
		}

		// 인증 안 했을 경우 인증하란 메세지 발생
		String y = "Y";
		if (!(vo.getUser_key().equals(y))) {
			result = -2;
			return result;
		}

		// 입력한 아이디와 스토어id값을 통해 정보가 존재 할 경우
		if (vo != null) {
			// 아이디,비번 모두 같은경우
			System.out.println("1단계");
			System.out.println("아이디값은?:"+vo.getEmail().matches(email));
			
			if (vo.getEmail().matches(email) & BCrypt.checkpw(pwd, vo.getPwd())) {
				
				System.out.println("2단계");
				// 쿠키 체크 검사
				Cookie cookie = new Cookie("user_check", email);
				if (user_check.equals("true")) {
					response.addCookie(cookie);
					System.out.println("3단계-쿠키 아이디저장 O");
					// 쿠키 확인
					// System.out.println("Service check" + cookie);
				} else {
					System.out.println("3단계-쿠키 아이디저장 X");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}

				System.out.println("3단계-로그인단계");
				// 세션 저장하기 전에 비밀번호 가리기
				vo.setPwd("");

				

				// 세션에 vo 객체 저장
				httpSession.setAttribute("userSession", vo);
				System.out.println("회원아이디 세션 userSession : " + httpSession.getAttribute("userSession"));


				result = 1;

				// 중복로그인 start
				
				// 접속자 아이디를 세션에 담는다.
				httpSession.setAttribute("email", userVO.getEmail());

				// 이미 접속한 아이디인지 체크한다.
				loginManager.printloginUsers(); // 접속자 리스트
				if (loginManager.isUsing(userVO.getEmail())) {
					result = -3;
					System.out.println("@@@@@@@@@@@@@@@@@@@[중복로그인 발생]@@@@@@@@@@@@@@@@@@");
				} else {
					loginManager.setSession(httpSession, userVO.getEmail());
				}

				// 중복로그인 end
			}
		}

		return result;
	}
	
	public int usercheck_service(Member passchk, HttpSession httpSession,HttpServletResponse response
			) {

		System.out.println("UserLoginService // 로그인 객체 확인 userVO : " + passchk);
		String email = passchk.getEmail();
		String pwd = passchk.getPwd();

		
		Member vo = memberMapper.loginUser(email);


		System.out.println("UserLoginService // 로그인 객체 확인 vo : " + vo);

		// 로그인 결과값
		int result = 0;
		
		System.out.println("확인뇽:"+email+"이것도확인:"+pwd);



		// 회원 정보가 없을 시
		if (vo == null) {
			result = 0;
			return result;
		}

		// 인증 안 했을 경우 인증하란 메세지 발생
	

		// 입력한 아이디와 스토어id값을 통해 정보가 존재 할 경우
		if (vo != null) {
			// 아이디,비번 모두 같은경우
			System.out.println("1단계");
			System.out.println("아이디값은?:"+vo.getEmail().matches(email));
			
			if (vo.getEmail().matches(email) && BCrypt.checkpw(pwd, vo.getPwd())) {
				
				System.out.println("2단계");
				// 쿠키 체크 검사
				Cookie cookie = new Cookie("user_check", email);
				
				System.out.println("3단계-로그인단계");
				httpSession.setAttribute("userSession", vo);
				System.out.println("회원아이디 세션 userSession : " + httpSession.getAttribute("userSession"));
				result = 1;

				// 중복로그인 start
				
				// 접속자 아이디를 세션에 담는다.
				httpSession.setAttribute("email", passchk.getEmail());

				
			

				result = 1;

			
			}
		}

		return result;
	}
	
	public int passCheck_Service(Member member, HttpSession session)
			 {

		System.out.println("UserLoginService // 비밀번호 입력 확인  member : " + member);
		String pwd = member.getPwd();
		String email = (String) session.getAttribute("email");

		
		Member vo = memberMapper.loginUser(email);


		System.out.println("UserLoginService // 로그인 객체 확인 vo : " + vo);

		// 로그인 결과값
		int result = 0;
		
		System.out.println("확인뇽:"+email+"이것도확인:"+pwd);



		// 회원 정보가 없을 시
		if (vo == null) {
			result = 0;
			return result;
		}

		// 인증 안 했을 경우 인증하란 메세지 발생
	

		// 입력한 아이디와 스토어id값을 통해 정보가 존재 할 경우
		if (vo != null) {
			// 아이디,비번 모두 같은경우
			System.out.println("1단계");
			System.out.println("아이디값은?:"+vo.getEmail().matches(email));
			
			if (vo.getEmail().matches(email) && BCrypt.checkpw(pwd, vo.getPwd())) {
				
				System.out.println("2단계");
				
				
				System.out.println("3단계-로그인단계");
				session.setAttribute("userSession", vo);
				System.out.println("회원아이디 세션 userSession : " + session.getAttribute("userSession"));
				result = 1;

				// 중복로그인 start
				
				// 접속자 아이디를 세션에 담는다.
				session.setAttribute("email", member.getEmail());

				
			

				result = 1;

			
			}
		}

		return result;
	}
	
	

	

	

	

}
