package com.it.every.student.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentDAO {

	public int studentRegister(StudentVO vo);
	public List<StudentVO> selectAll();
	public StudentVO selectByStuNo(String stuNo);
	public int updateStudent(StudentVO vo);
	public int deleteStudent(String stuNo);
}
