package com.it.every.distributeAssign.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.distributeAssign.model.DistributeAssignService;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/professor/assign")
@RequiredArgsConstructor
public class DistributeAssignController {
	private static final Logger logger
		= LoggerFactory.getLogger(DistributeAssignController.class);
	private final DistributeAssignService distributeAssignService;
	private final OpenSubjService openSubjService;
	
	@GetMapping("/distributeAssignReg")
	public void distributeAssignReg(HttpSession session, Model model) {
		String profNo = (String) session.getAttribute("no");
		logger.info("과제 개설 화면");
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
	}
	
	@PostMapping("/distributeAssignReg")
	public String distributeAssignReg_post() {
		logger.info("신규 과제 등록");
		
		return "/professor/assign/distributeAssignReg"; 
	}
}
