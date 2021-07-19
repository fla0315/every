package com.it.every.openSubj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.registration.controller.RegistrationController;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class OpenSubjController {
	
	private static final Logger logger 
	=LoggerFactory.getLogger(OpenSubjController.class);
	
	@GetMapping("/open_registration")
	public void open_rregistration() {
		
		logger.info("개설교과과정페이지");
	}
	
	
	
}
