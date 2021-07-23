package com.it.every.chitchat.outbox.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OutboxVO {
	private int msgNo;				//쪽지번호
	private String officialNo;		//발신인번호
	private String contents;		//내용
	private Timestamp sendDate;		//보낸날짜
	private String officialName;	//발신인명
	private String delFlag;			//삭제여부
}
