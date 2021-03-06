package com.it.every.timetable.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.calendar.model.CalendarService;
import com.it.every.calendar.model.CalendarVO;
import com.it.every.campus.model.CampusService;
import com.it.every.timetable.model.TimetableService;
import com.it.every.timetable.model.TimetableVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/timetable")
@RequiredArgsConstructor
public class TimetableController {

	private static final Logger logger = LoggerFactory.getLogger(TimetableController.class);

	private final TimetableService timetableService;
	private final CampusService campusService;
	private final CalendarService calendarService;
	
	
	@GetMapping("/timetable")
	public void open_rregistration(@ModelAttribute TimetableVO timetableVo, HttpSession session, Model model) {

		String userid = (String) session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");

		List<Map<String, Object>> Timelist = timetableService.selectTimetableByID(userid);

		model.addAttribute("Timelist", Timelist);

		String[][] arr = { { "", "", "", "", "" }, { "", "", "", "", "" }, { "", "", "", "", "" },
				{ "", "", "", "", "" }, { "", "", "", "", "" }, { "", "", "", "", "" }, { "", "", "", "", "" },
				{ "", "", "", "", "" } };

		for (int i = 0; i < Timelist.size(); i++) {
			String[] times = Timelist.get(i).get("SHORT_NAME").toString().split("");
			int first = Integer.parseInt(times[1]) - 1;
			int scond = Integer.parseInt(times[2]) - 1;
			String info = (String) Timelist.get(i).get("SUBJ_NAME")+"<br>"+(String) Timelist.get(i).get("PROF_NAME") +"<br>"+ (String) Timelist.get(i).get("CLASSROOM_NAME");
			
			switch (times[0]) {
			case "???":
				arr[first][0] = info;
				arr[scond][0] = info;
				break;
			case "???":
				arr[first][1] = info;
				arr[scond][1] = info;
				break;
			case "???":
				arr[first][2] = info;
				arr[scond][2] = info;
				break;
			case "???":
				arr[first][3] = info;
				arr[scond][3] = info;
				break;
			case "???":
				arr[first][4] = info;
				arr[scond][4] = info;
				break;
			}
		}
		
		logger.info("????????? ?????? ????????????");
		model.addAttribute("Timelist", arr);
		
	}
	
	@GetMapping("/timetableMain")
	public void open_rregistration11(@ModelAttribute TimetableVO timetableVo, HttpSession session, Model model) {
		String userid = (String) session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		List<Map<String, Object>> Timelist = timetableService.selectTimetableByID(userid);
		model.addAttribute("Timelist", Timelist);
		
		String[][] arr = { { "", "", "", "", "" }, { "", "", "", "", "" }, { "", "", "", "", "" },
				{ "", "", "", "", "" }, { "", "", "", "", "" }, { "", "", "", "", "" }, { "", "", "", "", "" },
				{ "", "", "", "", "" } };
		
		for (int i = 0; i < Timelist.size(); i++) {
			String[] times = Timelist.get(i).get("SHORT_NAME").toString().split("");
			int first = Integer.parseInt(times[1]) - 1;
			int scond = Integer.parseInt(times[2]) - 1;
			String info = (String) Timelist.get(i).get("SUBJ_NAME")+"<br>"+(String) Timelist.get(i).get("PROF_NAME") +"<br>"+ (String) Timelist.get(i).get("CLASSROOM_NAME");
			
			switch (times[0]) {
			case "???":
				arr[first][0] = info;
				arr[scond][0] = info;
				break;
			case "???":
				arr[first][1] = info;
				arr[scond][1] = info;
				break;
			case "???":
				arr[first][2] = info;
				arr[scond][2] = info;
				break;
			case "???":
				arr[first][3] = info;
				arr[scond][3] = info;
				break;
			case "???":
				arr[first][4] = info;
				arr[scond][4] = info;
				break;
			}
		}
		logger.info("????????? ?????? ????????????");
		model.addAttribute("Timelist", arr);
	}
	
	
	@RequestMapping("/calendarMain")
	public String calendar(Model model) {
		logger.info("???????????? ??????");
		
		List<CalendarVO> calendarList = calendarService.selectCalendar();
		List<Map<String, Object>> allList = calendarService.selectAll();
		logger.info("???????????? ?????? ??????, calendarList.size={}", calendarList.size());
		logger.info("???????????? ?????? ??????, allList.size={}", allList.size());
		
		String str ="";
		int num =0;
		for (CalendarVO vo : calendarList) {
			
			str +="{";
			str += "title: '" + vo.getContents() + "', ";
			str += "start: '" + vo.getSDate().substring(0, 10) + "', ";
			str += "end: '" + vo.getEDate().substring(0, 10) + "'";
			str +="}";
			
			num ++;
			if(num<calendarList.size()){
				str +=", ";
			}		
		}
		
		logger.info("str = {}", str);
		
		model.addAttribute("calendarList", calendarList);
		model.addAttribute("allList", allList);
		model.addAttribute("str", str);
		
		return "timetable/calendarMain";
	}
	
	
	

}
