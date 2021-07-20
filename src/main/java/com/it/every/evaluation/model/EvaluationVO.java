package com.it.every.evaluation.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EvaluationVO {
	private String subCode;
	private String stuNo;
	private String classification;
	private int midterm;
	private int finals;
	private long assignment;
	private long attendance;
	private int etc;
	private long totalGrade;
	private Timestamp regDate;
	private Timestamp editDate;
}
