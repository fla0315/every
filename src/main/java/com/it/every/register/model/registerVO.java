package com.it.every.register.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class registerVO {
	
	//인증번호용 체크
	private String num;

	//휴대폰 체크용
		private String hp1;
	    private String hp2;
	    private String hp3;
	
	//회원가입 시 유형 체크용
	 private String Chk_info;
	 
	//회원가입 시 번호 체크용 
	 private String student;
	 private String admin;
	 private String professor;
	
	//안 겹치도록 
	//다른 vo 참고 없이 몽땅 stu_no를 이용해서 돌립니다. 
	private String Stu_no;
	private String User_id;
	private String pwd;
	private char Indentitystate;
	private String Email; 
	private String phonenum;
	
	
}
