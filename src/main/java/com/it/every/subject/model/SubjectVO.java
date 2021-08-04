package com.it.every.subject.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjectVO {
	
	private String subjCode;		/* 과목코드 */
	private String typeCode;		/* 구분코드 */
	private String subjName; 		/* 과목명 */
	private String semester;		/* 학기 */
	private String grade ; 			/* 학년 */
	private String timetable;		/* 시간표 */
	private String explanation; 	/* 과목설명 */
	private int credit;				/* 학점 */
	private int personnel;			/* 인원수 */
	private String type;			/* 교과구분 */
	private String profName;		/* 교수명	 */
	private String subjYear;		/* 개설년도	 */
	
}
