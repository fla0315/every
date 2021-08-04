package com.it.every.lecture.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureDAO {

	public List<Map<String, Object>> selectLecture();
	public int registerOpenSubj(LectureVO vo);
	public int registerSubjTime(LectureVO vo);
	public Map<String, String> selectByOsCode(String openSubCode);
	public int editOpenSubj(LectureVO vo);
	public int editSubjTime(LectureVO vo);
	public int deleteOpenSubj(String openSubCode);
	public int deleteSubjTime(String openSubCode);
}
