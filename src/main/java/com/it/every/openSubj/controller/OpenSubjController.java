package com.it.every.openSubj.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.registration.controller.RegistrationController;

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
		
		
		List<OpenSubjVO> list = openSubjService.selectScholarALL();
		
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		
		model.addAttribute("list", list);
		
		return "registration/open_registration";
		
	}
	
	
	
}
