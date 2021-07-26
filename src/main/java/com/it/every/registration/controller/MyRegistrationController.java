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
	
	@RequestMapping("/myregistration")
	public String myregistration(HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		//String userid ="fla0315";
		
		logger.info("나의수상신청목록 페이지");
		List<Map<String ,Object>> list = studentRegistrationService.searchMyRegistarion(userid);
		Map<String, Object> map = studentService.selectStudentDeptView(userid);
		
		logger.info("나의수상신청목록 , list.size()={}", list.size());
		logger.info("학생정보 조회결과 , map={}", map);
		
		model.addAttribute("list",list);
		model.addAttribute("map", map);
		
		
		
		return "registration/myregistration";
	}
	
	
	@RequestMapping("/myregistrationInsert")
	public String myregistrationInsert(HttpSession session,@ModelAttribute RegistrationVO registrationVo ,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationVo.setStuNo(stuNo);
		//String userid ="fla0315";
		logger.info("수강신청페이지 페이지 vo={} ",registrationVo);
		
		int cnt = studentRegistrationService.insertMyRegistarion(registrationVo);
		logger.info("수강신청 결과, cnt={}", cnt);
		
		String msg="수강신청 실패!", url="/member/register";
		if(cnt>0) {
			msg="수강신청되었습니다.";
			url="redirect:/registration/myregistration";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	
	
}
