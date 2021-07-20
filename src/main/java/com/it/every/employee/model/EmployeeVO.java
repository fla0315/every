package com.it.every.employee.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmployeeVO {

	private String empNo;
	private String empId;
	private String empName;
	private String pwd;
	private Timestamp startDate;
	private Timestamp resignationDate;
	private char identityState;
	private int depCode;
	private int positonCode;
	private int authCode;
	
}
