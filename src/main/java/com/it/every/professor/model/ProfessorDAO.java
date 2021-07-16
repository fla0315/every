package com.it.every.professor.model;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProfessorDAO {
	ProfessorVO selectByid(String userid);
	Map<String, Object> selectProfessorDeptView(String userid);
	int checkDuplicate(String userid);
	String selectPwd(String userid);
	int updateProf(ProfessorVO vo);
}
