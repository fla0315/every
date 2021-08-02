package com.it.every.syllabus.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SyllabusVO {
	private String openSubCode; //개설과목코드
	private String syllabus; //실라버스 파일 이름
	private int theoryTime; //이론시간
	private int trainingTime; //실습시간
}
