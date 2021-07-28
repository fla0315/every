package com.it.every.admin.professor.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProfessorManageServiceImpl implements ProfessorManageService{
	
	private final ProfessorManageDAO studentDao;

	@Override
	public int professorRegister(ProfessorManageVO vo) {
		return studentDao.professorRegister(vo);
	}

	@Override
	public List<ProfessorManageVO> selectAll() {
		return studentDao.selectAll();
	}

	@Override
	public ProfessorManageVO selectByProfNo(String profNo) {
		return studentDao.selectByProfNo(profNo);
	}

	@Override
	public int updateProfessor(ProfessorManageVO vo) {
		return studentDao.updateProfessor(vo);
	}

	@Override
	public int deleteProfessor(String profNo) {
		return studentDao.deleteProfessor(profNo);
	}
	
	
	
}
