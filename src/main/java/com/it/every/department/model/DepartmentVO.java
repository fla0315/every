package com.it.every.department.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DepartmentVO {

	private int deptNo;
	private int facultyNo;
	private String deptName;
	private String tel;
	private String buildingCode;
	private int totalCredit;
	
}
