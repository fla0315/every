package com.it.every.attendance.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceVO {
	private String openSubCode;		//개설교과목번호
	private String stuNo;			//학번
	private String classification;	//수강구분
	private String first;				//1주차
	private String second;				//2주차
	private String third;				//3주차
	private String fourth;				//4주차
	private String fifth;				//5주차
	private String sixth;				//6주차
	private String seventh;			//7주차
	private String eighth;				//8주차
	private String ninth;				//9주차
	private String tenth;				//10주차
	private int point;				//점수
}
