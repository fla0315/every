package com.it.every.registration.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.registration.model.RegistrationVO;
import com.it.every.registration.model.StudentRegistrationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class CancleRegistrationController {
	
	private static final Logger logger 
		=LoggerFactory.getLogger(CancleRegistrationController.class);

	private final OpenSubjService openSubjService;
	private final StudentRegistrationService studentRegistrationService;
	
	
	@GetMapping("/cancle_registration")
	public String registration11(@ModelAttribute OpenSubjVO openSubjVo ,HttpSession session, Model model) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		
		logger.info("학생아이디, 학생 번호 ,user_id={},no={}",userid,stuNo);
		
		logger.info("수강신청내역 페이지");
		logger.info("개설과목들 불러오기");
		
		List<OpenSubjVO> list = openSubjService.OpenRegistraionALL();
		List<Map<String, Object>> facultyMap=openSubjService.selectFacultyS();
		List<Map<String, Object>> typeMap= openSubjService.selectTypeS();
		List<Map<String, Object>> Mylist = studentRegistrationService.selectMyRegistarion(userid);
		
		
		
		logger.info("개설교과과정페이지 전체 ,Mylist.size()={}", Mylist.size());
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		logger.info("학과 전체 ,facultyMap={}", facultyMap);
		logger.info("이수구분 전체 ,typeMap={}", typeMap);
		model.addAttribute("Mylist", Mylist);
		model.addAttribute("list", list);
		model.addAttribute("facultyMap", facultyMap);
		model.addAttribute("typeMap", typeMap);
		
		return "registration/cancle_registration";
		
	}
	
	@RequestMapping("/cancle_registration")
	public String myregistrationDelete11(HttpSession session,@ModelAttribute RegistrationVO registrationVo  ,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationVo.setStuNo(stuNo);
		//String userid ="fla0315";
		logger.info("수강신청페이지 페이지 vo={} ",registrationVo);
		
			int cnt = studentRegistrationService.deleteMyRegistarion(registrationVo);
			
			String msg ="수상취소 완료!" , url ="/registration/cancle_registration";
			if(cnt>0) {
				msg="수강취소완료.";
				url="/registration/cancle_registration";
			}else {
				msg="수강취소실패.";
				url="/registration/cancle_registration";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		
	}
	
	
	
	
}
