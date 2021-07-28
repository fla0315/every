package com.it.every.category.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class categoryVO {

	private int category_code;
	private String category_name;
	private char usage;
	private Timestamp reg_date;

	
}
