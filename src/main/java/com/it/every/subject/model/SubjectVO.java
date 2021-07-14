package com.it.every.subject.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjectVO {
	
	private String subj_code;	/* 과목코드 */
	private String prof_no; 	/* 교수번호 */
	private String semester;	 /* 학기 */
	private String subj_name; 	/* 과목명 */
	private String major; 		/* 학부/과 */
	private String grade ; 		/* 학년 */
	private String timetable;	/* 강의실/시간표 */
	private String course_type;	/* 이수구분 */
	private String  explanation;	 		/* 과목설명 */
	private int credit;			/* 이수학점 */
	private int personnel;		/* 인원 */
	private Timestamp open_date;	/* 개설날짜  */
	private Timestamp  close_date;	/* 폐지날짜 */
	
	
}
