package com.it.every.evaluation.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.evaluation.model.EvaluationService;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/professor")
public class AttendanceController {
	private static final Logger logger
	= LoggerFactory.getLogger(AttendanceController.class);
	
	private final OpenSubjService openSubjService;
	
	@RequestMapping("/attendance")
	public String evaluationRecord(@RequestParam String openSubCode, Model model) {
		logger.info("출석부 조회");
		
		String profNo = "1"; //@RequestParam String profNo, login시, session으로 받아야함
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			
		}
		
		return "/professor/attendance";
	}
}
