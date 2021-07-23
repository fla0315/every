package com.it.every.evaluation.controller;

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
	public String attendanceEdit(@ModelAttribute AttendanceVO vo, @RequestParam String open, Model model) {
		logger.info("개인 출석 등록/수정 처리, 파라미터 vo={}, openSubCode={}", vo, open);
		vo.setOpenSubCode(open);
		
		int cnt = attendanceService.editBystuNo(vo);
		logger.info("개인 출석 등록/수정 처리 결과, cnt={}", cnt);
		
		String msg="등록/수정 실패!", url="/professor/attendance?openSubCode="+open;
		if(cnt>0) {
			evaluationService.updateAttend(vo);
			return "redirect:/professor/attendance?openSubCode="+open;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
