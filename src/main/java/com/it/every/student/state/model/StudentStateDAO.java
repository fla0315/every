package com.it.every.student.state.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentStateDAO {

	public List<StudentStateVO> selectAllState();
}
