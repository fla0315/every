package com.it.every.admin.student.model;

import java.util.List;

public interface StudentManageService {

	public int studentRegister(StudentManageVO vo);
	public List<StudentManageVO> selectAll();
	public StudentManageVO selectByStuNo(String stuNo);
	public int updateStudent(StudentManageVO vo);
	public int deleteStudent(String stuNo);
	public List<StudentManageVO> selectByYear(StudentManageVO vo);
	public List<StudentManageVO> selectBeingInSchool();
}
