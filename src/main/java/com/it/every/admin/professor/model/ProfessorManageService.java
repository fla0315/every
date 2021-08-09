package com.it.every.admin.professor.model;

import java.util.List;
import java.util.Map;

public interface ProfessorManageService {

	public int professorRegister(ProfessorManageVO vo);
	public List<ProfessorManageVO> selectAll();
	public ProfessorManageVO selectByProfNo(String profNo);
	//public ProfessorManageVO selectByDeptNo(String deptNo);
	public List<ProfessorManageVO> selectByDeptNo(String deptNo);
	public int updateProfessor(ProfessorManageVO vo);
	public int deleteProfessor(String profNo);
	public List<Map<String, Object>> selectPosition();
	public List<Map<String, Object>> selectMajorPosition(String deptName);
}
