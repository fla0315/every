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

import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class OpenSubjController {
	
	private static final Logger logger 
	=LoggerFactory.getLogger(OpenSubjController.class);
	
	
	private final OpenSubjService openSubjService;
	
	
	@GetMapping("/open_registration")
	public String open_rregistration(@ModelAttribute OpenSubjVO openSubjVo , Model model) {
		
		logger.info("개설교과과정페이지");
		
		
		List<OpenSubjVO> list = openSubjService.OpenRegistraionALL();
		List<Map<String, Object>> facultyMap=openSubjService.selectFacultyS();
		List<Map<String, Object>> typeMap= openSubjService.selectTypeS();
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		logger.info("학과 전체 ,facultyMap={}", facultyMap);
		logger.info("이수구분 전체 ,typeMap={}", typeMap);
		
		
		model.addAttribute("list", list);
		model.addAttribute("facultyMap", facultyMap);
		model.addAttribute("typeMap", typeMap);
		
		return "registration/open_registration";
		
	}
	
	
	
}
