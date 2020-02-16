package com.yj.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member{

	
	private String email;
	private String pwd;
	private String nickname;
	private String profile;
	private Date rdate;
	private long auth_no;
	private String user_key;
	private String phone;




}
