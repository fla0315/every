package com.it.every.category.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class categoryVO {

	private int categoryCode;
	private String categoryname;
	private char usage;
	private Timestamp regdate;

	
}
