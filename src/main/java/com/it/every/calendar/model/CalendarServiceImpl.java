package com.it.every.calendar.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {

	private final CalendarDAO calendarDao;

	@Override
	public List<CalendarVO> selectCalendar() {
		return calendarDao.selectCalendar();
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return calendarDao.selectAll();
	}

	@Override
	public int registerCalendar(CalendarVO vo) {
		return calendarDao.registerCalendar(vo);
	}

	
	@Override
	public int editCalendar(CalendarVO vo) {
		return calendarDao.editCalendar(vo);
	}

	@Override
	public int deleteCalendar(int calNo) {
		return calendarDao.deleteCalendar(calNo);
	}

	@Override
	public Map<String, Object> selectByCalNo(int calNo) {
		return calendarDao.selectByCalNo(calNo);
	}

	
}
