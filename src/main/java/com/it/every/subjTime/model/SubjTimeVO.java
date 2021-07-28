package com.it.every.subjTime.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjTimeVO {

	private int lectureTimeNo;		//강의시간표코드
	private String openSubCode;		//개설교과과목코드
	private String classroomCode;	//강의실코드
	private String timetableCode;	//시간기준코드
	
}
