package com.it.every.subject.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjectVO {
	
	private String subj_code;	/* �����ڵ� */
	private String prof_no; 	/* ������ȣ */
	private String semester;	 /* �б� */
	private String subj_name; 	/* ����� */
	private String major; 		/* �к�/�� */
	private String grade ; 		/* �г� */
	private String timetable;	/* ���ǽ�/�ð�ǥ */
	private String course_type;	/* �̼����� */
	private String  explanation;	 		/* ���񼳸� */
	private int credit;			/* �̼����� */
	private int personnel;		/* �ο� */
	private Timestamp open_date;	/* ������¥  */
	private Timestamp  close_date;	/* ������¥ */
	
	
}
