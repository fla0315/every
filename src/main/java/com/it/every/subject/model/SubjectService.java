package com.it.every.subject.model;

import java.util.List;

public interface SubjectService {

	public List<SubjectVO> selectSubject();
	public int subjectRegister(SubjectVO vo);
}
