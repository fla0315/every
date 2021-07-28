package com.it.every.admin.professor.position.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProfessorPositionServiceImpl implements ProfessorPositionService {

	private final ProfessorPositionDAO professorPositionDao;

	@Override
	public List<ProfessorPositionVO> selectPosition() {
		return professorPositionDao.selectPosition();
	}
	
}
