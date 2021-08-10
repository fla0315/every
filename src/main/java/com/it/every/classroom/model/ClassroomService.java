package com.it.every.classroom.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.it.every.lecture.model.LectureVO;

public interface ClassroomService {

	public List<ClassroomVO> selectClassroom();
	public List<ClassroomVO> selectUsableY();
	public int changeUsable(@Param("classroomCode") String classroomCode, 
			@Param("usable") String usable);
	public List<ClassroomVO> usableClassroom(LectureVO vo);
}
