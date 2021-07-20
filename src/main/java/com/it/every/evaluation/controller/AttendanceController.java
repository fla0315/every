package com.it.every.evaluation.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.attendance.model.AttendanceService;
import com.it.every.attendance.model.AttendanceVO;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/professor")
public class AttendanceController {
	private static final Logger logger
	= LoggerFactory.getLogger(AttendanceController.class);
	
	private final OpenSubjService openSubjService;
	private final AttendanceService attendanceService;
	
	@RequestMapping("/attendance")
	public String evaluationRecord(@RequestParam String openSubCode, HttpSession session, Model model) {
		logger.info("출석부 조회");
		
		String profNo = (String) session.getAttribute("no");
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			List<Map<String, Object>> atList = attendanceService.showAttendance(openSubCode);
			logger.info("출석부 조회 결과, atList.size={}", atList.size());
			
			List<String> numList = new ArrayList<>();
			numList.add("FIRST");
			numList.add("SECOND");
			numList.add("THIRD");
			numList.add("FOURTH");
			numList.add("FIFTH");
			numList.add("SIXTH");
			numList.add("SEVENTH");
			numList.add("EIGHTH");
			numList.add("NINTH");
			numList.add("TENTH");
			logger.info("numList={}",numList.size());
			
			model.addAttribute("atList", atList);
			model.addAttribute("numList", numList);
		}
		return "/professor/attendance";
	}
}
