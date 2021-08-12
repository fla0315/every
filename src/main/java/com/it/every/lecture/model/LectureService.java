package com.it.every.lecture.model;

import java.util.List;
import java.util.Map;

public interface LectureService {

	public List<Map<String, Object>> selectLecture();
	public int registerOpenSubj(LectureVO vo);
	public Map<String, String> selectByOsCode(String openSubCode);
	public int editOpenSubj(LectureVO vo);
	public int deleteOpenSubj(String openSubCode);
	public Map<String, Object> selectScoreAvg(String openSubjCode);
	public List<Map<String, Object>> selectMajorCount(String openSubjCode);
	public List<Map<String, Object>> selectGradeCount(String openSubjCode);
	public List<Map<String, Object>> selectByProfNo(String profNo);
	public List<Map<String, Object>> selectByDeptNo(String deptNo);
}
