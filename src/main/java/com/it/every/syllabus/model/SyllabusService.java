package com.it.every.syllabus.model;

import java.util.List;
import java.util.Map;

public interface SyllabusService {
	List<Map<String, Object>> checkSyllabusList(String profNo);
	int insertSyllabus(SyllabusVO vo);
}
