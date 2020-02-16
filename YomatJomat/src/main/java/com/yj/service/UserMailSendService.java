package com.yj.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yj.domain.Member;
import com.yj.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberMapper memberMapper;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	
	// 회원가입 발송 이메일(인증키 발송)
	@Transactional
	public void mailSendWithUserKey(String email, String nickname, HttpServletRequest request) {
		
		String key = getKey(false, 20);
		memberMapper.GetKey(email, key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 yomatjomat :p 밥도둑~ 입니다!</h2><br><br>" 
				+ "<h3>" + nickname + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8080/member/key_alter?email="+ email +"&user_key="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] yomatjomat :p\t" +nickname+"님의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");

			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		//"<a href='http://localhost/member/emailConfirm?email="
		
	}
	
	
	
	// 패스워드 찾기 이메일 발송
	@Transactional
	public void mailSendWithPassword(String email,HttpServletRequest request) {
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
		String key = getKey(false, 6);
		// 비밀번호 바꿔주는 메서드
		 
		// 회원 이름 꺼내는 코드
		Member vo = memberMapper.userInfo(email);
		String name = vo.getEmail();
		int idx = name.indexOf("@");
		String nameresult = name.substring(0, idx);

		System.out.println("비밀번호 찾기 : Service");
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ nameresult +"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:8080/'>YomatJomat :p 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[YOMATJOMAT :p] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		key =(BCrypt.hashpw(key, BCrypt.gensalt(10)));
		memberMapper.searchPassword(email, key);
	}
		
	
	
	public int alter_userKey_service(String email, String key) {
		
		int result = 0;
		
		
		result = memberMapper.alter_userKey(email, key);
		log.info("#메일 전송으로 넘어가서 키값이랑 이메일값 넘어오는지 확인"+email+ "#key:"+key);
		
		return result;
	}
	


}


