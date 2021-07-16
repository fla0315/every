package com.it.every.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class ProfessorManageController {

	private static final Logger logger = LoggerFactory.getLogger(ProfessorManageController.class);
	
	@RequestMapping("/professor/professorList")
	public String professorList() {
		logger.info("교수조회 화면");
		
		return "admin/professor/professorList";
	}
	
	
	@RequestMapping("/professor/professorRegister")
	public String professorRegister() {
		logger.info("교수등록 화면");
		
		return "admin/professor/professorRegister";
	}
	
	@RequestMapping("/chart/professorChart")
	public String professorChart() {
		logger.info("교수강의통계 화면");
		
		return "admin/chart/professorChart";
	}
}
