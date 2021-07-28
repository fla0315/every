package com.it.every.admin.professor.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProfessorManageDAO {
	
	public int professorRegister(ProfessorManageVO vo);
	public List<ProfessorManageVO> selectAll();
	public ProfessorManageVO selectByProfNo(String profNo);
	public int updateProfessor(ProfessorManageVO vo);
	public int deleteProfessor(String profNo);
}
