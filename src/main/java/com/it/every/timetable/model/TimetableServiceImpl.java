package com.it.every.timetable.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TimetableServiceImpl implements TimetableService{

	private final TimetableDAO timetableDao;

	@Override
	public List<TimetableVO> selectTimetable() {
		return timetableDao.selectTimetable();
	}

	@Override
	public List<Map<String, Object>> selectTimetableByID(String userid) {
		return timetableDao.selectTimetableByID(userid);
	}
	
	
}
