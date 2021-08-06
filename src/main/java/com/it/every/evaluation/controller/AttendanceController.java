package com.it.every.evaluation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.attendance.model.AttendanceService;
import com.it.every.attendance.model.AttendanceVO;
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
	private final AttendanceService attendanceService;
	private final EvaluationService evaluationService;
	
	@RequestMapping("/attendance")
	public String attendanceCheck(@RequestParam String openSubCode, HttpSession session, Model model) {
		logger.info("출석부 조회");
		
		String profNo = (String) session.getAttribute("no");
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			List<Map<String, Object>> atList = attendanceService.showAttendance(openSubCode);
			logger.info("출석부 조회 결과, atList.size={}", atList.size());
			
			model.addAttribute("atList", atList);
			model.addAttribute("open", openSubCode);
		}
		return "/professor/attendance";
	}
	
	@RequestMapping("/attendanceEdit")
	public String attendanceEdit(@ModelAttribute AttendanceVO vo, Model model) {
		logger.info("개인 출석 등록/수정 처리, 파라미터 vo={}, openSubCode={}", vo);
		
		int cnt = attendanceService.editBystuNo(vo);
		logger.info("개인 출석 등록/수정 처리 결과, cnt={}", cnt);
		
		String msg="등록/수정 실패!", url="/professor/attendance?openSubCode="+vo.getOpenSubCode();
		if(cnt>0) {
			evaluationService.updateAttend(vo);
			Map<String, Object> map = new HashMap<>();
			map.put("STU_NO", vo.getStuNo());
			map.put("SUB_CODE", vo.getOpenSubCode());
			evaluationService.totalGrade(map);
			return "redirect:/professor/attendance?openSubCode="+vo.getOpenSubCode();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/attendanceAll")
	public String attendanceAll(@RequestParam String openSubCode, @RequestParam String week, Model model) {
		logger.info("출석 주차 전체 등록, 파라미터 openSubCode={}, week={}", openSubCode, week);
		AttendanceVO vo = new AttendanceVO();
		vo.setOpenSubCode(openSubCode);
		if(week.equals("first")) {//1
			vo.setFirst("출석");
		}else if(week.equals("second")) {//2
			vo.setSecond("출석");
		}else if(week.equals("third")) {//3
			vo.setThird("출석");
		}else if(week.equals("fourth")) {//4
			vo.setFourth("출석");
		}else if(week.equals("fifth")) {//5
			vo.setFifth("출석");
		}else if(week.equals("sixth")) {//6
			vo.setSixth("출석");
		}else if(week.equals("seventh")) {//7
			vo.setSeventh("출석");
		}else if(week.equals("eighth")) {//8
			vo.setEighth("출석");
		}else if(week.equals("ninth")) {//9
			vo.setNinth("출석");
		}else if(week.equals("tenth")) {//10
			vo.setTenth("출석");
		}
		
		logger.info("vo={}", vo);
		int cnt = attendanceService.attendanceAll(vo);
		String msg="전체 출석 등록 실패!", url="/professor/attendance?openSubCode="+openSubCode;
		if(cnt>0) {
			return "redirect:/professor/attendance?openSubCode="+openSubCode;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
