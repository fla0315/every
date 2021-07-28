package com.it.every.admin.student.state.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentStateServiceImpl implements StudentStateService{

	private final StudentStateDAO studentStateDao;
	
	@Override
	public List<StudentStateVO> selectAllState() {
		return studentStateDao.selectAllState();
	}

	
}
