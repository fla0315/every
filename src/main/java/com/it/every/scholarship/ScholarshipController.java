package com.it.every.scholarship;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.student.model.StudentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/scholarship")
@RequiredArgsConstructor
public class ScholarshipController {

	private static final Logger logger = LoggerFactory.getLogger(ScholarshipController.class);

	private final StudentService studentService;
	
	
	
	@RequestMapping("/scholarshipWrite")
	public String scholarshipWrite() {
		
		logger.info("장학금 신청 화면 보여주기");
		
		return "scholarship/scholarshipWrite";
	}
	
	
	@RequestMapping("/scholarshipPDF")
	public String scholarshipPDF() {
		
		logger.info("scholarshipPDF 화면 보여주기");
		
		return "scholarship/scholarshipPDF";
	}
	
	
	@RequestMapping("/scholarshipList")
	public String scholarshipList(HttpSession session, Model model) {

		//String userid = (String)session.getAttribute("userId");
		String userid ="fla0315";
		
		logger.info("장학금 조회 , 매개변수 userid={}", userid);
		
		
		List<Map<String, Object>> list = studentService.selectByScholarship(userid);
	
		Map<String, Object> map = studentService.selectStudentDeptView(userid);
		
		logger.info("장학금 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);

		
		return "scholarship/scholarshipList";

	}
	
	
}
