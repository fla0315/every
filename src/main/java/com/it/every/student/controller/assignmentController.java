package com.it.every.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/student")
@RequiredArgsConstructor
public class assignmentController {
	
	private static final Logger logger 
		=LoggerFactory.getLogger(assignmentController.class);

	
	@RequestMapping("/assignment/StudentAssignment")
	public void assignment() {
		
		
	}

}
