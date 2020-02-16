package com.yj.service;


import java.io.PrintWriter;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yj.domain.Member;
import com.yj.mailhandle.MailHandler;
import com.yj.mailhandle.TempKey;
import com.yj.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper memberMapper;
	
	

	@Override
	public int idCheck(String email) {
		
		return memberMapper.idCheck(email);
	}

	@Override
	public int nickCheck(String nickname) {
		
		return memberMapper.nickCheck(nickname);
	}
	
	@Override
	public void register(Member signup) {
		
		memberMapper.register(signup);
	

	}
	
	@Override
	public void update(String email,String nickname,String phone) {
		memberMapper.update(email,phone,nickname);
	}
	
	@Override
	public void pwdUpdate(Member member) {
		memberMapper.updatePwd(member);
	}
	
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	@Override
	public String findid(HttpServletResponse response,String phone) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String email = memberMapper.findemail(phone);
		
		if(email==null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다!);");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			return email;
			
		}
		
	}

	

}
