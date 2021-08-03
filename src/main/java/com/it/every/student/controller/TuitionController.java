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
import com.it.every.tuition.model.TuitionVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/tuition")
@RequiredArgsConstructor
public class TuitionController {
	
	private static final Logger logger = LoggerFactory.getLogger(TuitionController.class);

	private final StudentService studentService;
	
	@RequestMapping("/tuitionList")
	public String tuitionList(HttpSession session, Model model) {

		String userid = (String)session.getAttribute("user_id");
		//String userid ="fla0315";
		
		logger.info("등록금 조회 , 매개변수 userid={}", userid);
		
		List<Map<String, Object>> list = studentService.selectByStuId(userid);
		Map<String, Object> map = studentService.selectStudentDeptView(userid);
		
		logger.info("등록금 조회 결과 list.size={}", list.size());
		logger.info("등록금 조회 결과 map={}", map);
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);

		return "tuition/tuitionList";

	}
	
	@RequestMapping("/tuitionPDF")
	public String tuitionPDF(@ModelAttribute TuitionVO tuitionVo ,HttpSession session, @RequestParam(defaultValue = "0") String tuitionNo, Model model) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		
		System.out.println(tuitionNo);
		
		tuitionVo.setStuNo(stuNo);
		tuitionVo.setTuitionNo(Integer.parseInt(tuitionNo));
		
		System.out.println(stuNo);
		
		logger.info("등록금 pdf 화면 , 파라미터 tuitionVo={} tuitionNo={}",tuitionVo,tuitionNo);
		
		Map<String, Object> map = studentService.selectByTuitionNo(tuitionVo);
		
		logger.info("등록금 pdf 화면 map={}", map);
		
		model.addAttribute("map", map);
		
		
		return "tuition/tuitionPDF";
		
	}
	
	
	
	
}
