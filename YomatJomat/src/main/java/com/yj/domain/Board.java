package com.yj.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private long board_no; //
	private String email;
	private String subject;
	private String content;
	private int viewcount;
	private int thumbsup;
	private Date wdate;
	private String nickName;
	
}
