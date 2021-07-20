package com.it.every.attendance.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService {
	private final AttendanceDAO attendanceDao;

	@Override
	public int registerAttendance(String openSubCode, String stuNo, String classification) {
		return attendanceDao.registerAttendance(openSubCode, stuNo, classification);
	}

	@Override
	public List<Map<String, Object>> showAttendance(String openSubCode) {
		return attendanceDao.showAttendance(openSubCode);
	}
	
}
