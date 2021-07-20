package com.it.every.attendance.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	int registerAttendance(String openSubCode, String stuNo, String classification);
	List<Map<String, Object>> showAttendance(String openSubCode);
}
