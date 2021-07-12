package com.it.every.professor.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/professor")
@Controller
public class ProfessorController {
	private static final Logger logger
	= LoggerFactory.getLogger(ProfessorController.class);
	
	@RequestMapping("/profMain")
	public void profMain() {
		logger.info("교수님 메인 화면");
	}
}
