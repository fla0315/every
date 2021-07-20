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
	private int first;				//1주차
	private int second;				//2주차
	private int third;				//3주차
	private int fourth;				//4주차
	private int fifth;				//5주차
	private int sisxth;				//6주차
	private int seventh;			//7주차
	private int eighth;				//8주차
	private int ninth;				//9주차
	private int tenth;				//10주차
	private int point;				//점수
}
