package com.it.every.assignment.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AssignmentVO {
	
	
	private int assignNo; //과제번호
	private String openSubCode; //과제교과과목코드
	private String stuNo; //학번
	private String fileName; //파일이름
	private long fileSize; //파일 사이즈
	private String originalFileName; //원본파일네임
	private Timestamp applyDate; //제출일
	
	
	
}
