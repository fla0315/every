package com.it.every.registration.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RegistrationVO {

	private String openSubCode; /* 개설교과과목코드 */
	private String  stuNo; /* 학번 */
	private String  classification ; /* 수강구분 */
	private Timestamp regDate ;/* 수강일자 */
	private int score; /* 성적 */
	private char lectureEvalFlag ;/* 강의평가완료여부 */
	
}
