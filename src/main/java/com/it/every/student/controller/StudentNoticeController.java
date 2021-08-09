package com.it.every.student.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.post.model.PostService;
import com.it.every.registration.model.StudentRegistrationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/student/studentNotice")
public class StudentNoticeController {
	
	
	private static final Logger logger 
		=LoggerFactory.getLogger(StudentNoticeController.class);
	
	
	
	private final StudentRegistrationService regiService;
	private final PostService postService;
	
	
	
	@RequestMapping("/studentNotice")
	public String notice(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		
		List<Map<String, Object>> Mylist =regiService.selectMyRegistarion(userid);
		model.addAttribute("Mylist",Mylist);
		logger.info("과목명 , Mylist.size()={}",Mylist.size());
		
		List<Map<String, Object>> NList =postService.selectByNoticeStudent(userid);
		model.addAttribute("NList",NList);
		logger.info("학생 공지사항 , NList.size()={}",NList.size());
		
		logger.info("학생 과목별 공지사항");
		
		return "student/studentNotice/studentNotice";
	}
	
	
	@RequestMapping("/studentNoticeAjax")
	@ResponseBody
	public List<Map<String, Object>> noticeAjax(@RequestParam String opensubcode, HttpSession session, Model model) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		System.out.println(opensubcode);
		
		List<Map<String, Object>> NList =postService.selectByNoticeStudent(stuNo);
	
		
		model.addAttribute("NList",NList);
		logger.info("학생 공지사항 , NList.size()={}",NList.size());
		
		logger.info("학생 과목별 공지사항");
		
		return NList;
	}
	
	
	@RequestMapping("/studentNoticeDetail")
	public String studentNoticeDetail(@RequestParam(defaultValue = "0") int postNo ,HttpSession session, Model model) {
		logger.info("학생 과목별 공지사항 디테일");
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		
		List<Map<String, Object>> NList =postService.selectByNoticeStudent(userid);
		model.addAttribute("NList",NList);
		logger.info("학생 공지사항 , NList.size()={}",NList.size());
		
		String contents = postService.contentsByPostNo(postNo);
		model.addAttribute("contents",contents);
		logger.info("학생 공지사항 , contents={}",contents);
		
		return "student/studentNotice/studentNoticeDetail";
	}
	
}
