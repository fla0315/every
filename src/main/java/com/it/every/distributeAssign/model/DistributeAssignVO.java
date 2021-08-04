package com.it.every.distributeAssign.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DistributeAssignVO {
	 
	private int assignNo; //과제번호
	private String openSubCode; //과제교과과목코드
	private String assignName; //과제이름
	private Timestamp regDate; //제출일
	private String studentId;
	
}
