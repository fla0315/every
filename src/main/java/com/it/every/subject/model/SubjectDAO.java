package com.it.every.subject.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjectDAO {

	public List<SubjectVO> selectSubject();
	public int subjectRegister(SubjectVO vo);
}
