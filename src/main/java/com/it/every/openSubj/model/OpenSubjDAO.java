package com.it.every.openSubj.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OpenSubjDAO {

	List<OpenSubjVO> selectScholarALL();
	
}
