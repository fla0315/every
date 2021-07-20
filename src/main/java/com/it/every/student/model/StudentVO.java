package com.it.every.student.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentVO {
	
	private String stuNo ;/* 학번 */
	private String studentId;/* 아이디 */
	private String pwd; /* 비밀번호 */
	private String name ; /* 성명 */
	private String semester;/* 학기 */
	private String major ;/* 전공 */
	private String minor ; /* 부전공 */
	private String admissionDate; /* 입학일 */
	private String graduationDate ; /* 졸업일 */
	private int credits ; /* 이수학점 */
	private String indentityState ; /* 본인인증상태 */
	private String indentityCode ; /* 본인인증코드 */
	private Timestamp changeDate ;/* 비밀번호 변경일 */
	private String state ; /* 학적상태번호 */
	private int deptNo ;/* 학과번호 */
	private String phoneNum; /*전화번호*/

	
	
}
