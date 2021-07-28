package com.it.every.subjType.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjTypeDAO {

	public List<SubjTypeVO> selectSubjType();
}
