package com.it.every.professor.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/professor/notice")
@RequiredArgsConstructor
public class ProfessorNoticeController {
	private static final Logger logger
	= LoggerFactory.getLogger(ProfessorNoticeController.class);
	
	private final OpenSubjService openSubjService;
	
	@RequestMapping("/noticeWrite")
	public String noticeWrite(@RequestParam (required=false) String openSubCode, Model model, HttpSession session) {
		String profNo = (String) session.getAttribute("no");
		logger.info("개설교과목 공지사항 등록, profNo={}", profNo);
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		return "/professor/notice/noticeWrite";
	}
	
	@RequestMapping("/noticeList")
	public void noticeList(@RequestParam (required=false) String openSubCode, Model model, HttpSession session) {
		logger.info("개설교과목 공지사항 조회");
		
		String profNo = (String) session.getAttribute("no");
		logger.info("개설교과목 공지사항 등록, profNo={}", profNo);
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			
		}
	}
}


