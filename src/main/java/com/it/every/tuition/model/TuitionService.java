package com.it.every.tuition.model;

import java.util.List;
import java.util.Map;

public interface TuitionService {

	public List<TuitionVO> selectTuition();
	public List<Map<String, Object>> selectTopFive();
	public List<Map<String, Object>> selectFaculty();
}
