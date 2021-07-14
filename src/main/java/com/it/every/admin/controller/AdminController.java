package com.it.every.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/student/studentList")
	public String studentList() {
		logger.info("학생조회 화면");
		
		return "admin/student/studentList";
	}
	
	
	@RequestMapping("/professor/professorList")
	public String professorList() {
		logger.info("교수조회 화면");
		
		return "admin/professor/professorList";
	}
	
	
	@RequestMapping("/employee/employeeList")
	public String employeeList() {
		logger.info("임직원조회 화면");
		
		return "admin/employee/employeeList";
	}
	
	@RequestMapping("/mainDisplay/calendar")
	public String calendar() {
		logger.info("학사일정 화면");
		
		return "admin/mainDisplay/calendar";
	}
	
	@RequestMapping("/mainDisplay/campusMap")
	public String campusMap() {
		logger.info("캠퍼스맵 화면");
		
		return "admin/mainDisplay/campusMap";
	}
	
	@RequestMapping("/mainDisplay/notice")
	public String notice() {
		logger.info("공지사항 화면");
		
		return "admin/mainDisplay/notice";
	}
	
	@RequestMapping("/mainDisplay/lunchMenu")
	public String lunchMenu() {
		logger.info("식단표 화면");
		
		return "admin/mainDisplay/lunchMenu";
	}
	
	@RequestMapping("/mainDisplay/question")
	public String question() {
		logger.info("Q&A게시판 화면");
		
		return "admin/mainDisplay/question";
	}
	
	@RequestMapping("/chart/memberChart")
	public String memberChart() {
		logger.info("학생성적통계 화면");
		
		return "admin/chart/memberChart";
	}
	
	@RequestMapping("/chart/majorChart")
	public String majorChart() {
		logger.info("학과통계 화면");
		
		return "admin/chart/majorChart";
	}
	
	@RequestMapping("/chart/classChart")
	public String classChart() {
		logger.info("강의별통계 화면");
		
		return "admin/chart/classChart";
	}
}
