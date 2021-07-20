package com.it.every.controller;

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
	
	//휴대폰 추가
	private String phonenum;
	
	//휴대폰 체크용
		private String hp1;
	    private String hp2;
	    private String hp3;
	
	private String stu_no;
	private String student_id;
	private String pwd;
	private String name;
	private String semester;
	private int major;
	private String minor;
	private Timestamp admission_date;
	private Timestamp graduation_date;
	private int credits;
	private char indenity_state;
	private String indenity_code;
	private Timestamp change_date;
	private String state;
	private int dept_no;
}
