package com.it.every.board.model;


import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

import com.it.every.employee.model.EmployeeVO;

import lombok.Getter;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class BoardVO {
	//여기는 게시판
	private int bdCode;
	private int authCode; //권한코드
	private int categoryCode;//카테고리코드
	private String bdName; //이름
	private Timestamp regDate; //등록일 
	private Timestamp editDate; //수정일
	private int bdOrder; //게시판 순서
	private char usage; //댓글사용여부
	private char isReply; //댓글사용여부
	private char isComment; //답글사용여부
	private char isPrivate; //비공개여부 
	private char isUpload; //업로드가능여부
	private int maxupFile;//최대 업로드 가능 숫자
	private int maxfileSize;//최대 업로드 가능 용량
	private String opensubcode;
	
}
