package com.it.every.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RegistrationSearchVO extends SearchVO{
	
	private String subjYear; //년도
	private String semester; //학기
	private int  grade; //학년
	private String type; //이수구분
	private String facultyName; //학과 
	private String deptName; //department에서 학과
	private String subjName;//과목명
	private String openSubCode;//과목명
	private String stuNo;//학생번호
	private String studentId;//학생 아이디
	
}
