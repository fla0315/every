package com.it.every.scholarship.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarshipVO {
	
	private int scholarship_no;/* 장학금번호 */
	private String scholarship_type; /* 장학금종류 */
	private int scholarship ; /* 장학금 금액 */
	
	
}
