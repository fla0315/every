package com.it.every.openSubj.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OpenSubjVO {
	private String openSubCode;
	private String subjCode;
	private String profNo;
	private Timestamp openDate;
	private Timestamp closeDate;
}
