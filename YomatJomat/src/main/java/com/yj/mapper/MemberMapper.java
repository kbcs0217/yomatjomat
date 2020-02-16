package com.yj.mapper;





import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yj.domain.Member;



//매퍼가 dao의 역할을 해준다.
public interface MemberMapper {
	Member loginUser(@Param("email")String email);// 유저 로그인 메서드
	public void register(Member signup); //회원가입(수정요망)
	int idCheck(String email); //아이디중복
	int nickCheck(String nickname); //닉네임중복
	int GetKey(String email,String userkey); //유저인증키생성
	int alter_userKey(String email, String key); //유저인증키y로 바꿔줌
	int searchPassword(String email, String key); //임시비번변경
	String searchId(@Param("phone")String phone);// 유저 ID 찾기
	Member searchPw(String userId);// 유저 PW 찾기
	Member userInfo(String email); //유저이메일 불러오기
	String findemail(String phone);// 유저 ID 찾기
	public void updatePwd(Member member);
	public void update(String email,String nickname,String phone);
	

}
