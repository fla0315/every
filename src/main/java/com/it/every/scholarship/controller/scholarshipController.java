package com.it.every.scholarship.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/scholarship")
@RequiredArgsConstructor
public class scholarshipController {
	private static final Logger logger = LoggerFactory.getLogger(scholarshipController.class);
	
	
	@RequestMapping("/scholarshipWrite")
	public void scholarshipWrite() {
		
		logger.info("장학금 등록 페이지");
		
	}
	
	
	
	
	
}
