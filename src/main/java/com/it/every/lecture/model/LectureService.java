package com.it.every.lecture.model;

import java.util.List;
import java.util.Map;

public interface LectureService {

	//public List<LectureVO> selectLecture();
	public List<Map<String, Object>> selectLecture();
	//public int registerLecture(Map<String, String> map);
	public int registerOpenSubj(LectureVO vo);
}
