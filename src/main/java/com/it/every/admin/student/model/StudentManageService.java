package com.it.every.admin.student.model;

import java.util.List;
import java.util.Map;

public interface StudentManageService {

	public int studentRegister(StudentManageVO vo);
	public List<StudentManageVO> selectAll();
	public StudentManageVO selectByStuNo(String stuNo);
	public int updateStudent(StudentManageVO vo);
	public int deleteStudent(String stuNo);
	public List<StudentManageVO> selectByYear(StudentManageVO vo);
	public List<StudentManageVO> selectBeingInSchool();
	public List<Map<String, Object>> selectGrade();
	public List<Map<String, Object>> selectMajorGrade(String major);
	public List<Map<String, Object>> selectSubjectScore();
	public Map<String, Object> selectSubjectAvg();
	public Map<String, Object> selectDeptAvg();
	public Map<String, Object> selectTotalAvg();
}
