package com.it.every.student.model;

import java.util.List;

public interface StudentService {

	public int studentRegister(StudentVO vo);
	public List<StudentVO> selectAll();
	public StudentVO selectByStuNo(String stuNo);
	public int updateStudent(StudentVO vo);
	public int deleteStudent(String stuNo);
}
