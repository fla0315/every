package com.it.every.tuition.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TuitionDAO {

	public List<TuitionVO> selectTuition();
	public List<Map<String, Object>> selectTopFive();
	public List<Map<String, Object>> selectFaculty();
}
