package com.it.every.student.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentVO {
	
	private String stu_no;/* 학번 */
	private String student_id;/* 아이디 */
	private String pwd ; /* 비밀번호 */
	private String name;/* 성명 */
	private String semester; /* 학기 */
	private String major; /* 전공 */
	private String minor; /* 부전공 */
	private Timestamp admission_date; /* 입학일 */
	private Timestamp graduation_date;/* 졸업일 */
	private int credits;/* 이수학점 */
	private String indentity_state;/* 본인인증상태 */
	private String indentity_code;/* 본인인증코드 */
	private Timestamp change_date;/* 비밀번호 변경일 */
	private String state;/* 학적상태번호*/
	private int dept_no;/* 학과번호 */
	private String phonenum; /*휴대전화*/

	
}
