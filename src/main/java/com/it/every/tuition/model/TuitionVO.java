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
	private String stu_no; //학번
	private String semester; //학기
	private int tuition; //등록금
	private String deposit_state; /* 납부상테 */
	private Timestamp deposit_date; /* 납부일자  */
	
	
	
}
