package com.it.every.award.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AwardVO {

	private int awardNo;				// 장학금 번호
	private String stuNo;				// 학생번호
	private int scholarshipNo;			// 장학금종류 번호
	private String awardingDate;		// 장학금 수여일
	private String major;				// 전공
	private String name;				// 학생명
	private String scholarshipType;		// 장학금종류
	private int scholarship;			// 장학금 금액
	private String approved;			// 승인여부
	

}
