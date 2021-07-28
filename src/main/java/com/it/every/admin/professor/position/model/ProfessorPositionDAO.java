package com.it.every.admin.professor.position.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProfessorPositionDAO {

	public List<ProfessorPositionVO> selectPosition();
}
