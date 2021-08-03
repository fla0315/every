package com.it.every.scholarship.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.common.RegistrationSearchVO;
import com.it.every.scholarship.model.ScholarshipVO;
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
	public String scholarshipPDF(@ModelAttribute ScholarshipVO scholarshipVo ,@RequestParam(defaultValue = "0") String scholarshipNo,HttpSession session, Model model) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		
		logger.info("scholarshipPDF 화면 보여주기");
		
		scholarshipVo.setScholarshipNo(Integer.parseInt(scholarshipNo));
		scholarshipVo.setStudentId(userid);
		
		List<Map<String, Object>> list = studentService.selectByScholashipNo(scholarshipVo);

		logger.info("장학금 pdf 화면 list={}", list);
		
		model.addAttribute("list", list);
		
		return "scholarship/scholarshipPDF";
	}
	
	
	
	
	@RequestMapping("/scholarshipListSearch")
	@ResponseBody
	public List<Map<String, Object>> scholarshipList11(@ModelAttribute RegistrationSearchVO regiSearchVo,
			HttpSession session, Model model) {

		logger.info("개설교과과정페이지");
		logger.info("regiSearchVo={}",regiSearchVo);

		List<Map<String, Object>> list = studentService.selectByScholarship(regiSearchVo);
		System.out.println(list);
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());

		model.addAttribute("list", list);
		
		
		return list;

	}
	
	
	
	@RequestMapping("/scholarshipList")
	public String scholarshipList(@ModelAttribute RegistrationSearchVO  regiSearchVo, HttpSession session, Model model) {

		String userid = (String)session.getAttribute("user_id");
		//String userid ="fla0315";
		
		regiSearchVo.setStudentId(userid);
		
		  regiSearchVo.setSemester("0"); 
		  regiSearchVo.setYear("0");
		logger.info("장학금 조회 , 매개변수 userid={}", userid);
		
		List<Map<String, Object>> list = studentService.selectByScholarship(regiSearchVo);
		System.out.println(list);
		System.out.println("==================================");
		Map<String, Object> map = studentService.selectStudentDeptView(userid);
		System.out.println(map);
		
		logger.info("장학금 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);

		
		return "scholarship/scholarshipList";

	}
	
	
}
