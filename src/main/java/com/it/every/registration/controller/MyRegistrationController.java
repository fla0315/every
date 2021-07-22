package com.it.every.registration.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.registration.model.StudentRegistrationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class MyRegistrationController {

	private static final Logger logger 
	=LoggerFactory.getLogger(MyRegistrationController.class);

	private final StudentRegistrationService studentRegistrationService;
	
	@RequestMapping("/myregistration")
	public String myregistration(HttpSession session, Model model) {
		
		//String userid = (String)session.getAttribute("userId");
		String userid ="fla0315";
		
		logger.info("나의수상신청목록 페이지");
		List<Map<String ,Object>> list = studentRegistrationService.searchMyRegistarion(userid);
		
		logger.info("나의수상신청목록 , list.size()={}", list.size());
		
		model.addAttribute("list",list);
		
		return "registration/myregistration";
	}
	
}
