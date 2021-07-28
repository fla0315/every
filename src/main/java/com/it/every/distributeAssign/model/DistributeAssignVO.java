package com.it.every.distributeAssign.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DistributeAssignVO {
	private int assignNo;			//과제번호
	private String openSubCode;		//개설교과목코드
	private String assignName;		//과제명
	private Timestamp regDate;		//등록일
}
