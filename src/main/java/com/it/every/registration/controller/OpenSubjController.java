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
import com.it.every.registrationCart.model.RegistrationCartVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class OpenSubjController {
	
	private static final Logger logger 
	=LoggerFactory.getLogger(OpenSubjController.class);
	
	
	private final OpenSubjService openSubjService;
	private final StudentRegistrationService studentRegistrationService;
	
	@GetMapping("/open_registration")
	public String open_rregistration(@ModelAttribute OpenSubjVO openSubjVo , HttpSession session,  Model model) {
		
		logger.info("개설교과과정페이지");
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		
		List<OpenSubjVO> list = openSubjService.OpenRegistraionALL();
		List<Map<String, Object>> facultyMap=openSubjService.selectFacultyS();
		List<Map<String, Object>> typeMap= openSubjService.selectTypeS();
		List<Map<String, Object>> Clist = studentRegistrationService.selectCart(userid);
		
		logger.info("개설교과과정페이지 전체 ,Clist.size()={}", Clist.size());
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		logger.info("학과 전체 ,facultyMap={}", facultyMap);
		logger.info("이수구분 전체 ,typeMap={}", typeMap);
		
		
		model.addAttribute("Clist", Clist);
		model.addAttribute("list", list);
		model.addAttribute("facultyMap", facultyMap);
		model.addAttribute("typeMap", typeMap);
		
		return "registration/open_registration";
		
	}
	
	
	@RequestMapping("/open_registrationCart")
	public String insertCart(HttpSession session,@ModelAttribute RegistrationCartVO registrationCartVo  ,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationCartVo.setStuNo(stuNo);
		logger.info("장바구니 user_id={},no={}",userid,stuNo );
		
		int cnt =studentRegistrationService.insertCart(registrationCartVo);
		String msg ="장바구니!" , url ="/registration/open_registrationCart";
		if(cnt>0) {
			msg="저장완료";
			url="/registration/open_registration";
		}else {
			msg="저장실패.";
			url="/registration/open_registration";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	
	@RequestMapping("/open_registrationCartDelete")
	public String myregistrationDelete(HttpSession session,@ModelAttribute RegistrationCartVO registrationCartVo  ,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationCartVo.setStuNo(stuNo);
		//String userid ="fla0315";
		logger.info("장바구니 페이지 vo={} ",registrationCartVo);
		
			int cnt = studentRegistrationService.deleteCart(registrationCartVo);
			
			String msg ="취소!" , url ="/registration/open_registration";
			if(cnt>0) {
				msg="취소완료.";
				url="/registration/open_registration";
			}else {
				msg="취소실패.";
				url="/registration/open_registration";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
