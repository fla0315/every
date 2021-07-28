package com.it.every.admin.employee.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmployeeManageVO {

	private String empNo;			//임직원번호
	private String empId;			//임직원아이디
	private String empName;			//임직원명
	private String pwd;				//비밀번호
	private String startDate;		//입사일
	private String resignationDate;	//퇴사일
	private char identityState;		//본인인증상태
	private int depCode;			//부서코드
	private int positionCode;		//직책코드
	private int authCode;			//권한코드
	private String depName;			//부서이름
	private String positionName;	//직책이름
	private String authDesc;		//권한이름
	
}
