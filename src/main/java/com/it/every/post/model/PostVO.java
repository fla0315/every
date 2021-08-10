package com.it.every.post.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostVO {
 
		private int postNo; //게시글번호
		private int bdCode; //게시판코드
		private char isPrivate; //비밀글여부
		private String writerCode; //작성자코드
		private String title; //제목
		private String contents; //내용
		private Timestamp regDate; //등록일
		private int readCount; //조회수
		private char delFlag; //삭제여부
		private int groupNo; //원본글번호
		private int sortNo; //정렬번호
		private int step; //차수
		private Timestamp editDate; //수정일
		
		//전혀 안들어가져서 체크용 하나 추가
		private int post;

		
		
}
