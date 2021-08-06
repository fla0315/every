package com.it.every.admin.professor.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProfessorManageServiceImpl implements ProfessorManageService{
	
	private final ProfessorManageDAO professorDao;

	@Override
	public int professorRegister(ProfessorManageVO vo) {
		return professorDao.professorRegister(vo);
	}

	@Override
	public List<ProfessorManageVO> selectAll() {
		return professorDao.selectAll();
	}

	@Override
	public ProfessorManageVO selectByProfNo(String profNo) {
		return professorDao.selectByProfNo(profNo);
	}

	@Override
	public int updateProfessor(ProfessorManageVO vo) {
		return professorDao.updateProfessor(vo);
	}

	@Override
	public int deleteProfessor(String profNo) {
		return professorDao.deleteProfessor(profNo);
	}

	@Override
	public List<Map<String, Object>> selectPosition() {
		return professorDao.selectPosition();
	}

	@Override
	public List<Map<String, Object>> selectMajorPosition(String deptName) {
		return professorDao.selectMajorPosition(deptName);
	}

	
	
	
	
}
