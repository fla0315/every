package com.it.every.syllabus.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SyllabusVO {
	private String openSubCode;
	private String syllabus;
	private int theoryTime;
	private int trainingTime;
}
