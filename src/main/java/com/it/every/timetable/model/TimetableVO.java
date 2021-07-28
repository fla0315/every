package com.it.every.timetable.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TimetableVO {

	private String timetableCode;	//시간기준코드
	private String timetableName;	//표시교시명
	private String day;				//요일
	private int period;				//교시
	private String shortTime;		//요약교시명

}
