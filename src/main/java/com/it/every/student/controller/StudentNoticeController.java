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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.board.model.BoardVO;
import com.it.every.common.RegistrationSearchVO;
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
	public String notice(HttpSession session, Model model, @ModelAttribute RegistrationSearchVO regiVo) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		regiVo.setOpenSubCode("0");
		regiVo.setStuNo(stuNo);
		List<Map<String, Object>> Mylist =regiService.selectMyRegistarion(userid);
		model.addAttribute("Mylist",Mylist);
		logger.info("과목명 , Mylist.size()={}",Mylist.size());
		
		List<Map<String, Object>> NList =postService.selectByNoticeStudent(regiVo);
		model.addAttribute("NList",NList);
		logger.info("학생 공지사항 , NList.size()={}",NList.size());
		
		logger.info("학생 과목별 공지사항");
		
		return "student/studentNotice/studentNotice";
	}
	
	
	@RequestMapping("/studentNoticeAjax")
	@ResponseBody
	public List<Map<String, Object>> noticeAjax(@RequestParam String openSubCode,@ModelAttribute RegistrationSearchVO regiVo ,HttpSession session, Model model) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		System.out.println(openSubCode);
		
		regiVo.setStuNo(stuNo);
		regiVo.setOpenSubCode(openSubCode);
		
		List<Map<String, Object>> NList =postService.selectByNoticeStudent(regiVo);
	
		
		model.addAttribute("NList",NList);
		logger.info("학생 공지사항 , NList.size()={}",NList.size());
		
		logger.info("학생 과목별 공지사항");
		
		return NList;
	}
	
	
	@RequestMapping("/studentNoticeDetail")
	public String studentNoticeDetail(@RequestParam(defaultValue = "0") int postNo , HttpSession session, Model model) {
		logger.info("학생 과목별 공지사항 디테일");
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		
		Map<String, Object>  map =postService.selectByJunggoPostNo(postNo);
		model.addAttribute("map",map);
		
		String contents = postService.contentsByPostNo(postNo);
		model.addAttribute("contents",contents);
		logger.info("학생 공지사항 , contents={}",contents);
		
		return "student/studentNotice/studentNoticeDetail";
	}
	
}
