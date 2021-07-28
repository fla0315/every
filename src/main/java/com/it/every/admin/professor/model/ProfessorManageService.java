package com.it.every.admin.professor.model;

import java.util.List;

public interface ProfessorManageService {

	public int professorRegister(ProfessorManageVO vo);
	public List<ProfessorManageVO> selectAll();
	public ProfessorManageVO selectByProfNo(String profNo);
	public int updateProfessor(ProfessorManageVO vo);
	public int deleteProfessor(String profNo);
}
