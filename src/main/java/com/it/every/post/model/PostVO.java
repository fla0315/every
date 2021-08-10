package com.it.every.post.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostVO {
	private int postNo;				//게시글번호
	private int bdCode;				//게시판번호
	private String writerCode;		//작성자코드
	private String title;			//제목
	private String contents;		//내용
	private Timestamp regDate;		//등록일
	private int readCount;			//조회수
	private String delFlag;			//삭제여부
	private int groupNo;			//원본글번호
	private int sortNo;				//정렬번호
	private int step;				//차수
	private Timestamp editDate;		//수정일
	private char isPrivate;			//비밀글여부
	private int price;				//가격
}
