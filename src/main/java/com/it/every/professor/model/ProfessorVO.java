package com.it.every.professor.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ProfessorVO {
	private int prof_no;				//교수번호
	private int position_no;			//직책번호
	private int dept_no;				//학과번호
	private String prof_name;			//교수명
	private String prof_id;				//아이디
	private String prof_pwd;			//비밀번호
	private String prof_email;			//이메일
	private Timestamp prof_start_date;	//임용일
	private Timestamp prof_end_date;	//퇴직일
	private char identity_state;		//본인인증상태
	private String identity_code;		//본인인증코드
	private Timestamp change_date;		//비밀번호 변경일
}