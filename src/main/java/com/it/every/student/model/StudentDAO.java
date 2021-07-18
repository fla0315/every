package com.it.every.student.model;

import java.util.List;
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

	//등록금조회
	List<Map<String, Object>> selectByStuId (String userid);
	Map<String, Object> selectByTuitionNo (String userid ,int tuitionNo);
	
}
