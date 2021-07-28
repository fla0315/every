package com.it.every.openSubj.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OpenSubjVO {

	private String openSubCode;		/* 개설교과과목코드 */
	private String subjCode; 		/* 과목코드 */
	private String profNo; 			/* 교수번호 */
	private Timestamp openDate; 	/* 개설일자 */
	private Timestamp closeDate; 	/* 폐지일자 */
	
}
