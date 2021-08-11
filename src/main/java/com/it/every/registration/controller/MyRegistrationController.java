package com.it.every.registration.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.common.RegistrationSearchVO;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.registration.model.RegistrationVO;
import com.it.every.registration.model.StudentRegistrationService;
import com.it.every.student.model.StudentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class MyRegistrationController {

	private static final Logger logger 
	=LoggerFactory.getLogger(MyRegistrationController.class);

	private final StudentRegistrationService studentRegistrationService;
	private final StudentService studentService;
	
	
	
	
	
	@RequestMapping("/myregistration1")
	@ResponseBody
	public List<Map<String, Object>>  myregistration1(@ModelAttribute RegistrationSearchVO regiSearchVo, HttpSession session, Model model) {
		logger.info("regiSearchVo={}",regiSearchVo);
		
		String userid = (String)session.getAttribute("user_id");
		regiSearchVo.setStudentId(userid);
		
		logger.info("나의수상신청목록 페이지");
		List<Map<String ,Object>> list = studentRegistrationService.searchMyRegistarion(regiSearchVo);
		
		logger.info("나의수상신청목록 , list.size()={}", list.size());
		
		model.addAttribute("list",list);
		
		return list;
	}
	
	
	
	
	
	
	
	@RequestMapping("/myregistration")
	public String myregistration(@ModelAttribute RegistrationSearchVO regiSearchVo, HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		//String userid ="fla0315";
		regiSearchVo.setStudentId(userid);
		regiSearchVo.setOpenYear("0");
		regiSearchVo.setSemester("0");
		logger.info("나의수상신청목록 페이지");
		
		System.out.println(regiSearchVo);
		
		
		List<Map<String ,Object>> list = studentRegistrationService.searchMyRegistarion(regiSearchVo);
		Map<String, Object> map = studentService.selectStudentDeptView(userid);
		
		logger.info("나의수상신청목록 , list.size()={}", list.size());
		logger.info("학생정보 조회결과 , map={}", map);
		
		model.addAttribute("list",list);
		model.addAttribute("map", map);
		
		
		
		return "registration/myregistration";
	}
	
	
}
