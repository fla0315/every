package com.it.every.calendar.model;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	public List<Map<String, Object>> selectAll();
	public List<CalendarVO> selectCalendar();
	public int registerCalendar(CalendarVO vo);
	public Map<String, Object> selectByCalNo(int calNo);
	public int editCalendar(CalendarVO vo);
	public int deleteCalendar(int calNo);
}
