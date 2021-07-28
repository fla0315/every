package com.it.every.subject.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SubjectServiceImpl implements SubjectService{

	private final SubjectDAO subjectDao;

	@Override
	public List<SubjectVO> selectSubject() {
		return subjectDao.selectSubject();
	}

	@Override
	public int subjectRegister(SubjectVO vo) {
		return subjectDao.subjectRegister(vo);
	}
	
	
}
