package com.it.every.timetable.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimetableDAO {

	public List<TimetableVO> selectTimetable();
	
	List<Map<String, Object>> selectTimetableByID(String userid); //학생별 개인 시간표조회
	
}
