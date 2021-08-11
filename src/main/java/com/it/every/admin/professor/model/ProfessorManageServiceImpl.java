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

	@Override
	public List<ProfessorManageVO> selectByDeptNo(String deptNo) {
		return professorDao.selectByDeptNo(deptNo);
	}

	@Override
	public Map<String, Object> selectProfLecRate() {
		return professorDao.selectProfLecRate();
	}

	@Override
	public Map<String, Object> selectDeptLecRate() {
		return professorDao.selectDeptLecRate();
	}

	@Override
	public Map<String, Object> selectAllLecRate() {
		return professorDao.selectAllLecRate();
	}

	@Override
	public List<Map<String, Object>> selectLecComment() {
		return professorDao.selectLecComment();
	}

	@Override
	public Map<String, Object> searchByProfName(String deptName, String profName, String subjName) {
		return professorDao.searchByProfName(deptName, profName, subjName);
	}

	
}
