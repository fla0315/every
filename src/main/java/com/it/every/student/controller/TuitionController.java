package com.it.every.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.student.model.StudentService;
import com.it.every.student.model.StudentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/tuition")
@RequiredArgsConstructor
public class TuitionController {
	
	private static final Logger logger = LoggerFactory.getLogger(TuitionController.class);

	private final StudentService studentService;
	
	@RequestMapping("/tuitionList")
	public String tuitionList(HttpSession session, Model model) {

		//String userid = (String)session.getAttribute("userId");
		String userid ="123";
		
		logger.info("등록금 조회 , 매개변수 userid={}", userid);
		
		List<Map<String, Object>> list = studentService.selectByStuId(userid);
		Map<String, Object> map = studentService.selectStudentDeptView(userid);
		
		logger.info("등록금 조회 결과 list.size={}", list.size());
		logger.info("등록금 조회??? 결과 map={}", map);
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);

		return "tuition/tuitionList";

	}
	
	@RequestMapping("/tuitionPDF")
	public String tuitionPDF(HttpSession session, @RequestParam(defaultValue = "0") int tuitionNo, Model model) {
		
		String userid ="123";
		tuitionNo =2;
		logger.info("등록금 pdf 화면 , 파라미터 tuitionNo={}",tuitionNo);
		
		/*
		Map<String, Object> map = studentService.selectByTuitionNo(userid, tuitionNo);
		
		logger.info("등록금 pdf 화면 map={}", map);
		
		model.addAttribute("map", map);
		*/
		
		return "tuition/tuitionPDF";
		
	}
	
	
	
	
}
