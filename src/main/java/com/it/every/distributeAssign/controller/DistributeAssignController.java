package com.it.every.distributeAssign.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.it.every.assignment.model.AssignmentService;
import com.it.every.assignment.model.AssignmentVO;
import com.it.every.common.ConstUtil;
import com.it.every.common.FileUploadUtil;
import com.it.every.distributeAssign.model.DistributeAssignService;
import com.it.every.distributeAssign.model.DistributeAssignVO;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.registration.model.StudentRegistrationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/professor/assign")
@RequiredArgsConstructor
public class DistributeAssignController {
	private static final Logger logger
		= LoggerFactory.getLogger(DistributeAssignController.class);
	
	private final DistributeAssignService distributeAssignService;
	private final OpenSubjService openSubjService;
	private final AssignmentService assignmentService;
	private final StudentRegistrationService studentRegistrationService;
	private final FileUploadUtil fileUploadUtil;
	
	@GetMapping("/distributeAssignReg")
	public void distributeAssignReg(HttpSession session, Model model) {
		String profNo = (String) session.getAttribute("no");
		logger.info("과제 개설 화면");
		Map<String, Object> map = new HashMap<>();
		map.put("profNo", profNo);
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			List<Map<String, Object>> aList = distributeAssignService.distributeAssignView(map);
			logger.info("교수님 개설강좌 목록 osList.size={}, aList.size={}", osList.size(), aList.size());
			model.addAttribute("osList", osList);
			model.addAttribute("aList", aList);
		}
	}
	
	@PostMapping("/distributeAssignReg")
	public String distributeAssignReg_post(@ModelAttribute DistributeAssignVO vo, Model model) {
		logger.info("신규 과제 등록, 파라미터 vo={}", vo);
		int cnt = distributeAssignService.newAssign(vo);
		
		String msg="과제 등록 실패", url="/professor/assign/distributeAssignReg";
		if(cnt>0) {
			msg = "새로운 과제가 등록되었습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "common/message";
	}
	
	@GetMapping("/assignmentCheck")
	public void assignmentCheck(@RequestParam(defaultValue = "") String openSubCode, @RequestParam(defaultValue="0") int assignNo, HttpSession session, Model model) {
		String profNo = (String) session.getAttribute("no");
		Map<String, Object> map = new HashMap<>();
		map.put("profNo", profNo);
		
		logger.info("과제 조회 및 점수 입력 화면");
		
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		logger.info("개설과목별 조회, 파라미터 openSubCode={}", openSubCode);
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			map.put("openSubCode", openSubCode);
			logger.info("map={}", map);
			List<Map<String, Object>> aList = distributeAssignService.distributeAssignView(map);
			model.addAttribute("aList", aList);
			model.addAttribute("open", openSubCode);
		}
		
		if(assignNo>0) {
			List<Map<String, Object>> sList = studentRegistrationService.selectByOpenSubCode(openSubCode);
			model.addAttribute("sList", sList);
			List<AssignmentVO> assignList = assignmentService.showAssignment(assignNo);
			logger.info("assignList.size={}", assignList.size());
			model.addAttribute("assignList", assignList);
		}
	}
	
	@GetMapping("/assignDetail")
	public void assignDetail(@RequestParam String stuNo, @RequestParam int assignNo, Model model) {
		logger.info("제출된 과제 채점화면, 파라미터 stuNo={}, assignNo={}", stuNo, assignNo);
		AssignmentVO vo = new AssignmentVO();
		vo.setStuNo(stuNo);
		vo.setAssignNo(assignNo);
		
		Map<String, Object> map = assignmentService.checkAssignByStuNo(vo);
		logger.info("map={}", map);
		model.addAttribute("map", map);
	}
	
	@PostMapping("/assignDetail")
	public String assignDetail_post(@ModelAttribute AssignmentVO vo) {
		logger.info("과제 채점 등록, vo={}", vo);
		
		int cnt = assignmentService.gradeForAssign(vo);
		if(cnt>0) {
			logger.info("점수 반영 성공");
		}
		
		return "/professor/assign/assignmentCheck?openSubCode="+vo.getOpenSubCode()+"&assignNo="+vo.getAssignNo();
	}
	
	@RequestMapping("/download")
	public ModelAndView download(@ModelAttribute AssignmentVO vo, HttpServletRequest request) {
		logger.info("과제 다운로드 처리, 파라미터 vo={}", vo);
		
		Map<String, Object> map = new HashMap<>();
		
		String uploadPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_ASSIGNMENT_FLAG);
		File file = new File(uploadPath, vo.getFileName());
		map.put("file", file);
		map.put("originalFileName", vo.getOriginalFileName());
		
		ModelAndView mav = new ModelAndView("AssigndownloadView", map);
		return mav;
	}
}
