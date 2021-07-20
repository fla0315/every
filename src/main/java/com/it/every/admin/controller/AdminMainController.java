package com.it.every.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@RequestMapping("/mainDisplay/calendar")
	public String calendar() {
		logger.info("학사일정 화면");
		
		return "admin/mainDisplay/calendar";
	}
	
	@RequestMapping("/mainDisplay/campusMap")
	public String campusMap() {
		logger.info("캠퍼스맵 화면");
		
		return "admin/mainDisplay/campusMap";
	}
	
	@RequestMapping("/mainDisplay/notice")
	public String notice() {
		logger.info("공지사항 화면");
		
		return "admin/mainDisplay/notice";
	}
	
	@RequestMapping("/mainDisplay/noticeWrite")
	public String noticeWrite() {
		logger.info("공지사항등록 화면");
		
		return "admin/mainDisplay/noticeWrite";
	}
	
	@RequestMapping("/mainDisplay/lunchMenu")
	public String lunchMenu() {
		logger.info("식단표 화면");
		
		return "admin/mainDisplay/lunchMenu";
	}
	
	@RequestMapping("/mainDisplay/question")
	public String question() {
		logger.info("Q&A게시판 화면");
		
		return "admin/mainDisplay/question";
	}
	
	@RequestMapping("/chart/majorProfChart")
	public String majorProfChart() {
		logger.info("학과별 교수통계 화면");
		
		return "admin/chart/majorProfChart";
	}
	
	@RequestMapping("/chart/classChart")
	public String classChart() {
		logger.info("강의별통계 화면");
		
		return "admin/chart/classChart";
	}
	
	@RequestMapping("/board/freeBoard")
	public String freeBoard() {
		logger.info("자유게시판 화면");
		
		return "admin/board/freeBoard";
	}
	
	@RequestMapping("/board/freeBoardReport")
	public String freeBoardReport() {
		logger.info("자유게시판 신고글관리 화면");
		
		return "admin/board/freeBoardReport";
	}
	
	@RequestMapping("/board/marketBoard")
	public String marketBoard() {
		logger.info("거래게시판 화면");
		
		return "admin/board/marketBoard";
	}
	
	@RequestMapping("/board/marketBoardReport")
	public String marketBoardReport() {
		logger.info("거래게시판 신고글관리 화면");
		
		return "admin/board/marketBoardReport";
	}
}
