package com.it.every.boardFile.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardFileVO {
	private int no;						//고유번호
	private int postNo;					//게시글번호
	private String fileName;			//파일명
	private long fileSize;				//파일크기
	private String originalFileName;	//원본파일명
	private int downCount;				//다운로드수
	private Timestamp upfileDate;		//업로드날짜
}
