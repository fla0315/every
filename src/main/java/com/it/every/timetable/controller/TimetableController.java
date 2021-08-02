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

import com.it.every.timetable.model.TimetableService;
import com.it.every.timetable.model.TimetableVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/timetable")
@RequiredArgsConstructor
public class TimetableController {

	private static final Logger logger = LoggerFactory.getLogger(TimetableController.class);

	private final TimetableService timetableService;

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
			String info = (String) Timelist.get(i).get("CLASSROOM_NAME") + (String) Timelist.get(i).get("PROF_NAME");
			
			switch (times[0]) {
			case "월":
				arr[first][0] = info;
				arr[scond][0] = info;
				break;
			case "화":
				arr[first][1] = info;
				arr[scond][1] = info;
				break;
			case "수":
				arr[first][2] = info;
				arr[scond][2] = info;
				break;
			case "목":
				arr[first][3] = info;
				arr[scond][3] = info;
				break;
			case "금":
				arr[first][4] = info;
				arr[scond][4] = info;
				break;
			}
		}
		
		logger.info("시간표 화면 보여주기");
		model.addAttribute("Timelist", arr);
	}

}
