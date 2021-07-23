package com.it.every.chitchat.inbox.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InboxVO {
	private int no;				//번호
	private int msgNo;			//쪽지번호
	private String officialNo;	//수신인번호
	private Timestamp readDate;	//읽은 날짜
	private String keepFlag;	//보관여부
}
