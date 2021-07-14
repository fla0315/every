package com.it.every.timetable.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.registration.controller.RegistrationController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/timetable")
@RequiredArgsConstructor
public class timetableController {

	private static final Logger logger 
	=LoggerFactory.getLogger(timetableController.class);

	
	@GetMapping("/timetable")
	public void open_rregistration() {
		
		logger.info("시간표 조회 페이지");
	}
	
}
