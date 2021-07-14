package com.it.every.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.timetable.controller.timetableController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/student")
@RequiredArgsConstructor
public class studentController {

	private static final Logger logger 
	=LoggerFactory.getLogger(timetableController.class);
	
	
	
	@GetMapping("/studentEdit")
	public void studentEdit() {
		
		logger.info("회원 수정 페이지");
	}
	
	
	
}
