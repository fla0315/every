package com.it.every.classroom.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ClassroomDAO {

	public List<ClassroomVO> selectClassroom();
	public List<ClassroomVO> selectUsableY();
	public int changeUsable(@Param("classroomCode") String classroomCode, 
			@Param("usable") String usable);
}
