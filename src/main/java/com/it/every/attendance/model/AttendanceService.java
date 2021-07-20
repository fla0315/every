package com.it.every.attendance.model;

import java.util.List;

public interface AttendanceService {
	int registerAttendance(String openSubCode, String stuNo, String classification);
	List<AttendanceVO> showAttendance(String openSubCode);
}
