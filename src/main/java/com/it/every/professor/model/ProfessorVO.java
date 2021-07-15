package com.it.every.professor.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ProfessorVO {
	private int prof_no;				//������ȣ
	private int position_no;			//��å��ȣ
	private int dept_no;				//�а���ȣ
	private String prof_name;			//������
	private String prof_id;				//���̵�
	private String prof_pwd;			//��й�ȣ
	private String prof_email;			//�̸���
	private Timestamp prof_start_date;	//�ӿ���
	private Timestamp prof_end_date;	//������
	private char identity_state;		//������������
	private String identity_code;		//���������ڵ�
	private Timestamp change_date;		//��й�ȣ ������
}