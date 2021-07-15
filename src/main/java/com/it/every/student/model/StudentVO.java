package com.it.every.student.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentVO {
	
	private String stu_no;/* �й� */
	private String student_id;/* ���̵� */
	private String pwd ; /* ��й�ȣ */
	private String name;/* ���� */
	private String semester; /* �б� */
	private String major; /* ���� */
	private String minor; /* ������ */
	private Timestamp admission_date; /* ������ */
	private Timestamp graduation_date;/* ������ */
	private int credits;/* �̼����� */
	private String indentity_state;/* ������������ */
	private String indentity_code;/* ���������ڵ� */
	private Timestamp change_date;/* ��й�ȣ ������ */
	private String state;/* �������¹�ȣ*/
	private int dept_no;/* �а���ȣ */
	private String phonenum; /*�޴���ȭ*/

	
}
