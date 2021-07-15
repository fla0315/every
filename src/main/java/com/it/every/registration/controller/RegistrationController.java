package com.it.every.registration.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class RegistrationController {
	private static final Logger logger 
	=LoggerFactory.getLogger(RegistrationController.class);

	
	@GetMapping("/open_registration")
	public void open_rregistration() {
		
		logger.info("������������ ��ȸ ������");
	}
	
	
	@GetMapping("/registration")
	public void registration() {
		
		logger.info("������û���� ��ȸ ������");
	}
	
	
}