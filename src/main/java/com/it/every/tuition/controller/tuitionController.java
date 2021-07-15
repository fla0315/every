package com.it.every.tuition.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.scholarship.controller.scholarshipController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/tuition")
@RequiredArgsConstructor
public class tuitionController {

	private static final Logger logger = LoggerFactory.getLogger(tuitionController.class);
	

	@RequestMapping("/tuitionList")
	public void scholarshipWrite() {
		
		logger.info("등록금 조회 페이지");
		
	}
	
	
}
