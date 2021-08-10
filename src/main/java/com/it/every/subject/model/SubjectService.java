package com.it.every.subject.model;

import java.util.List;

public interface SubjectService {

	public List<SubjectVO> selectSubject();
	public int registerSubject(SubjectVO vo);
	public SubjectVO selectBySubjCode(String subjCode);
	public String selectBySubjName(String subjName);
	public int editSubject(SubjectVO vo);
	public int deleteSubject(String subjCode);
}
