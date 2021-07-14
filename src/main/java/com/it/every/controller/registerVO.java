package com.it.every.controller;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class registerVO {
	
	private int stu_no;
	private String Col;
	private String pwd;
	private String name;
	private String semester;
	private int major;
	private int credits;
	private Timestamp admission_date;
	private Timestamp graduation_date;
	private char indenity_state;
	private int minor;
	private String indenity_code;
	private Timestamp change_date;
	private String state;
	private int dept_no;
}
