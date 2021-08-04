package com.it.every.tuition.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TuitionVO {

	private int tuitionNo;  		// 등록금번호
	private String semester; 		// 학기
	private String stuNo; 			// 학번
	private String name;			// 학생명
	private int tuition; 			// 납부금액
	private String depositState; 	// 납부상태
	private Timestamp depositDate; 	// 납부일자
	private String major;			// 전공(학과명)
	private String scholarship;		// 장학금
	private String approved;		// 장학금 승인여부
	
}
