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

	@Override
	public int editBystuNo(AttendanceVO vo) {
		return attendanceDao.editBystuNo(vo);
	}

	@Override
	public int attendanceAll(AttendanceVO vo) {
		if(vo.getFirst()==null) {
			vo.setFirst("");
		}
		if (vo.getSecond()==null) {
			vo.setSecond("");
		}
		if (vo.getThird()==null) {
			vo.setThird("");
		}
		if(vo.getFourth()==null) {
			vo.setFourth("");
		}
		if(vo.getFifth()==null) {
			vo.setFifth("");
		}
		if(vo.getSixth()==null) {
			vo.setSixth("");
		}
		if(vo.getSeventh()==null) {
			vo.setSeventh("");
		}
		if(vo.getEighth()==null) {
			vo.setEighth("");
		}
		if(vo.getNinth()==null) {
			vo.setNinth("");
		}
		if(vo.getTenth()==null) {
			vo.setTenth("");
		}
		
		return attendanceDao.attendanceAll(vo);
	}
	
}
