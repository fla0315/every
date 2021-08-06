package com.it.every.board.model;


import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

import com.it.every.employee.model.EmployeeVO;

import lombok.Getter;

@Getter
@Setter
@ToString
public class customVO {
	//여기는 게시판
	private int bdcode;
	private int authcode; //권한코드
	private int categorycode;//카테고리코드
	private String bdname; //이름
	private Timestamp regdate; //등록일 
	private Timestamp editdate; //수정일
	private int bdorder; //게시판 순서
	private char usage; //댓글사용여부
	private char isreply; //댓글사용여부
	private char iscomment; //답글사용여부
	private char isprivate; //비공개여부 
	private char isupload; //업로드가능여부
	private int maxupfile;//최대 업로드 가능 숫자
	private int maxfilesize;//최대 업로드 가능 용량

	
	//따로 사용용도
	private String deptname;
	private String type;
	private String subjname;
	private String personnel;
	private String profno;
	private String profname;

	//등록 및 수업 받아오기용으로 사용(추가됨)
	private String opensubcode;
	private String usertype;
	
	private String forbdname;
}
