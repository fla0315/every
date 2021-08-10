package com.it.every.reply.model;



import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {
	private int replyNo;
	private String writerCode;
	private int postNo;
	private String contents;
	private Timestamp regDate;
	private char delFlag; //삭제여부, Y면 안보이게
	private int step;
	private int sortNo;
	private int groupNo;

	//id 출력용
	private String userid;
}
