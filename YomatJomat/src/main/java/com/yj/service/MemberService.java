package com.yj.service;




import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yj.domain.Member;




public interface MemberService {
	
	

	public void register(Member signUp);
	public int idCheck(String email);
	public int nickCheck(String nickname);
	public void logout(HttpSession session);
	public String findid(HttpServletResponse response,String email) throws Exception;
	public void update(String email, String nickname, String phone);
	public void pwdUpdate(Member member);



 
	

	


}
