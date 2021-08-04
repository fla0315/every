package com.it.every.syllabus.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SyllabusDAO {
	List<Map<String, Object>> checkSyllabusList(String profNo);
	int insertSyllabus(SyllabusVO vo);
	SyllabusVO checkSyllabus(String openSubCode);
}
