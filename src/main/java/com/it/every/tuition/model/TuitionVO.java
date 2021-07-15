package com.it.every.tuition.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TuitionVO {

	private int no; /* ��ϱݹ�ȣ */
	private String stu_no; /* �й� */
	private String semester; /* �б� */
	private int tuition;/* �ݾ� */
	private String deposit_state; /* ���ο��� */
	private Timestamp deposit_date; /* ������ */
	
	
}
