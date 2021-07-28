package com.it.every.admin.student.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface StudentManageService {

	public int studentRegister(StudentManageVO vo);
	public List<StudentManageVO> selectAll();
	public StudentManageVO selectByStuNo(String stuNo);
	public int updateStudent(StudentManageVO vo);
	public int deleteStudent(String stuNo);
	public List<StudentManageVO> selectByYear(StudentManageVO vo);
	//public List<StudentManageVO> selectByYear(HashMap<String, Object> map);
}
