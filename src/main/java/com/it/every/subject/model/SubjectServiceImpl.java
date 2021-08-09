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
	public int registerSubject(SubjectVO vo) {
		return subjectDao.registerSubject(vo);
	}

	@Override
	public SubjectVO selectBySubjCode(String subjCode) {
		return subjectDao.selectBySubjCode(subjCode);
	}

	@Override
	public int editSubject(SubjectVO vo) {
		return subjectDao.editSubject(vo);
	}

	@Override
	public int deleteSubject(String subjCode) {
		return subjectDao.deleteSubject(subjCode);
	}

	@Override
	public String selectBySubjName(String subjName) {
		return subjectDao.selectBySubjName(subjName);
	}

	
	
	
}
