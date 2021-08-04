package com.it.every.lecture.model;

import java.util.List;
import java.util.Map;

public interface LectureService {

	public List<Map<String, Object>> selectLecture();
	public int registerOpenSubj(LectureVO vo);
	public Map<String, String> selectByOsCode(String openSubCode);
	public int editOpenSubj(LectureVO vo);
	public int deleteOpenSubj(String openSubCode);
}
