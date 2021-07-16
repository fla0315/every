package com.it.every.tuition.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TuitionVO {

	private int no;  //등록금번호
	private String stuNo; //학번
	private String semester; //학기
	private int tuition; //등록금
	private String depositState; /* 납부상테 */
	private Timestamp depositDate; /* 납부 일자  */
	
	
	
}
