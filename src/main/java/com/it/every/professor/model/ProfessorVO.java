package com.it.every.professor.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ProfessorVO {
	private String profNo;				//교수번호
	private int positionNo;				//직책번호
	private int deptNo;					//학과번호
	private String profName;			//교수명
	private String profId;				//교수 아이디
	private String profPwd;				//비밀번호
	private String profPh;				//전화번호
	private String profEmail;			//이메일
	private String profStartDate;	//임용일
	private String profEndDate;		//퇴직일
	private char identityState;			//본인인증상태
	private String identityCode;		//본인인증코드
	private String changeDate;		//비밀번호 변경일
}
