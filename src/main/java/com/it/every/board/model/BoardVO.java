package com.it.every.board.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class BoardVO {
	private int bdCode;			//게시판코드
	private int authCode;		//권한코드
	private int categoryCode;	//카테고리코드
	private String bdName;		//게시판이름
	private Timestamp regDate;	//게시판 등록일
	private Timestamp editDate;	//게시판 수정일
	private int dbOrder;		//게시판 순서
	private char usage;			//사용여부
	private char isReply;		//댓글여부
	private char isComment;		//답글여부
	private char isPrivate;		//비공개여부
	private char isUpload;		//업로드가능여부
	private int maxUpfile;		//업로드가능개수
	private long maxFileSize;	//업로드가능파일사이즈
	private String openSubCode;	//개설교과목번호
}
