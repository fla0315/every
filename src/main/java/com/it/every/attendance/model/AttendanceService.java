package com.it.every.attendance.model;

import java.util.List;
import java.util.Map;

public interface AttendanceService {
	int registerAttendance(String openSubCode, String stuNo, String classification);
	List<Map<String, Object>> showAttendance(String openSubCode);
	int editBystuNo(AttendanceVO vo);
}
