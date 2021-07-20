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
	
	@RequestMapping("/professor/professorEdit")
	public String professorEdit() {
		logger.info("교수정보 수정 화면");
		
		return "admin/professor/professorEdit";
	}
	
	@RequestMapping("/professor/professorDelete")
	public String professorDelete() {
		logger.info("교수정보 삭제");
		
		return "admin/professor/professorDelete";
	}
	
	
	@RequestMapping("/chart/professorChart")
	public String professorChart() {
		logger.info("교수강의통계 화면");
		
		return "admin/chart/professorChart";
	}
}
