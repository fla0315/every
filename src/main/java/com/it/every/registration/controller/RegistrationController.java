package com.it.every.registration.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class RegistrationController {
	private static final Logger logger 
	=LoggerFactory.getLogger(RegistrationController.class);

	private final OpenSubjService openSubjService;
	
	@GetMapping("/request_registration")
	public String registration(@ModelAttribute OpenSubjVO openSubjVo , Model model) {
		
		logger.info("수강신청내역 페이지");
		logger.info("개설과목들 불러오기");
		
		List<OpenSubjVO> list = openSubjService.OpenRegistraionALL();
		List<Map<String, Object>> facultyMap=openSubjService.selectFacultyS();
		List<Map<String, Object>> typeMap= openSubjService.selectTypeS();
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		logger.info("학과 전체 ,facultyMap={}", facultyMap);
		logger.info("이수구분 전체 ,typeMap={}", typeMap);
		
		model.addAttribute("list", list);
		model.addAttribute("facultyMap", facultyMap);
		model.addAttribute("typeMap", typeMap);
		
		return "registration/request_registration";
		
	}
	
	@RequestMapping ("/request_registration")
	public String registration_post() {
		
		logger.info("수강신청 누르면 수강신청되기");
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
