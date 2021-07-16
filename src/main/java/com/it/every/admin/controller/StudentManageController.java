package com.it.every.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class StudentManageController {

	private static final Logger logger = LoggerFactory.getLogger(StudentManageController.class);
	
	@RequestMapping("/student/studentList")
	public String studentList() {
		logger.info("학생조회 화면");
		
		return "admin/student/studentList";
	}
	
	@RequestMapping("/student/studentRegister")
	public String studentRegister() {
		logger.info("학생등록 화면");
		
		return "admin/student/studentRegister";
	}
	
	@RequestMapping("/chart/studentChart")
	public String studentChart() {
		logger.info("학생성적통계 화면");
		
		return "admin/chart/studentChart";
	}
	
	@RequestMapping("/chart/majorStuChart")
	public String majorStuChart() {
		logger.info("학과별 학생통계 화면");
		
		return "admin/chart/majorStuChart";
	}
	
}
