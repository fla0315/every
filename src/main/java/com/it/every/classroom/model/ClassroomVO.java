package com.it.every.classroom.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ClassroomVO {

	private String buildingName;	// 건물명
	private String classroomCode;	// 강의실번호
	private String classroomName;	// 강의실명
	private String buildingCode;	// 건물번호
	private String deptName;		// 학과명
	private char usable;			// 사용가능여부
}
