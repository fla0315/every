package com.it.every.subjEval.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjEvalVO {
	
	   private String openSubCode; /* 개설교과과목코드 */
	   private String stuNo ;/* 학번 */
	   private String  classification ; /* 수강구분 */
	   private int q1;/* 문항1 */
	   private int q2 ; /* 문항2 */
	   private int q3 ;/* 문항3 */
	   private int q4; /* 문항4 */
	   private int q5; /* 문항5 */
	   private String content; /* 평가내용 */
	   
}
