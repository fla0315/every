package com.it.every.freepage.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class postVO {
 
		public int postNo; //게시글번호
		public int bdCode; //게시판코드
		public int writerCode; //작성자코드
		public String title; //제목
		public String contents; //내용
		public Timestamp regDate; //등록일
		public int readCount; //조회수
		public char delFlag; //삭제여부
		public int groupNo; //원본글번호
		public int sortNo; //정렬번호
		public int step; //차수
		public Timestamp editDate; //수정일
		public char isPrivate; //비밀글여부
}
