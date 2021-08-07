package com.it.every.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.campus.model.CampusService;
import com.it.every.campus.model.CampusVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminMainController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	private final CampusService campusService;
	
	
	@RequestMapping("/campusInfo/calendar")
	public String calendar() {
		logger.info("학사일정 화면");
		
		return "admin/campusInfo/calendar";
	}
	
	@RequestMapping("/campusInfo/campusMap")
	public String campusMap(Model model) {
		logger.info("캠퍼스맵 화면");
		
		List<CampusVO> buildingList = campusService.selectBuilding();
		List<CampusVO> deptList = campusService.selectDepartment();
		
		logger.info("조회 결과, buildingList.size={}", buildingList.size());
		logger.info("조회 결과, deptList.size={}", deptList.size());
		
		model.addAttribute("buildingList", buildingList);
		model.addAttribute("deptList", deptList);
		
		return "admin/campusInfo/campusMap";
	}
	
	@RequestMapping("/campusInfo/notice")
	public String notice() {
		logger.info("공지사항 화면");
		
		return "admin/campusInfo/notice";
	}
	
	@RequestMapping("/campusInfo/noticeWrite")
	public String noticeWrite() {
		logger.info("공지사항등록 화면");
		
		return "admin/campusInfo/noticeWrite";
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
