package com.it.every.student.model;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.professor.model.ProfessorVO;

@Mapper
public interface StudentDAO {
	
	StudentVO selectByid(String userid);
	Map<String, Object> selectStudentDeptView(String userid);
	int checkDuplicate(String userid);
	String selectPwd(String userid);
	int updateStudent(StudentVO vo);
	
}
