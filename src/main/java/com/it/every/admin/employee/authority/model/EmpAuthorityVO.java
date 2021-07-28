package com.it.every.admin.employee.authority.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpAuthorityVO {

	private int authCode;
	private String authName;
	private String authDesc;
	private String regdate;
}
