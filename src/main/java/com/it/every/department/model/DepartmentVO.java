package com.it.every.department.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DepartmentVO {

	private int deptNo;				//학과번호
	private int facultyNo;			//학부번호
	private String deptName;		//학과명
	private String tel;				//사무실전화번호
	private String buildingCode;	//건물코드
	private int totalCredit;		//졸업이수학점
	
}
