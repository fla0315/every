package com.it.every.admin.professor.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.admin.professor.model.ProfessorManageService;
import com.it.every.admin.professor.model.ProfessorManageVO;
import com.it.every.admin.professor.position.model.ProfessorPositionService;
import com.it.every.admin.professor.position.model.ProfessorPositionVO;
import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/professor")
@RequiredArgsConstructor
public class ProfessorManageController {

	private static final Logger logger = LoggerFactory.getLogger(ProfessorManageController.class);
	private final ProfessorManageService professorManageService;
	private final ProfessorPositionService professorPositionService;
	private final DepartmentService departmentService;
	
	@RequestMapping("/professorList")
	public String professorList(Model model) {
		logger.info("교수목록 조회 화면");
		
		List<ProfessorManageVO> list = professorManageService.selectAll();
		logger.info("목록 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/professor/professorList";
	}
	
	
	@RequestMapping("/professorRegister")
	public String professorRegister(Model model) {
		logger.info("교수등록 화면");
		
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<ProfessorPositionVO> positionList = professorPositionService.selectPosition();
		
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("교수직책 조회 결과, positionList.size={}", positionList.size());
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		
		return "admin/professor/professorRegister";
	}
	
	@PostMapping("/register_post")
	public String register_post(@ModelAttribute ProfessorManageVO vo, Model model) {
		
		logger.info("교수등록 처리, 파라미터 vo={}", vo);
		
		int cnt = professorManageService.professorRegister(vo);
		logger.info("교수등록 결과, cnt={}", cnt);
		
		String msg = "교수등록 실패!", url = "/admin/professor/professorRegister";
		if(cnt > 0) {
			msg="교수정보가 등록되었습니다";
			url="/admin/professor/professorList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/professor/professorEdit")
	public String professorEdit(@RequestParam(defaultValue = "0") String profNo, Model model) {
		logger.info("교수정보 수정 화면");
		
		ProfessorManageVO vo = professorManageService.selectByProfNo(profNo);
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<ProfessorPositionVO> positionList = professorPositionService.selectPosition();
		
		logger.info("교수정보 수정 화면, 조회 결과 vo={}", vo);
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("교수직책 조회 결과, positionList.size={}", positionList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		
		return "admin/professor/professorEdit";
	}
	
	
	@PostMapping("/professor/professorEdit")
	public String professorEdit_post(@ModelAttribute ProfessorManageVO vo, Model model) {
		
		logger.info("교수정보수정 처리, 파라미터 vo={}", vo);
		
		String msg = "비밀번호 체크실패", url = "/admin/professor/professorEdit?profNo=" + vo.getProfNo();
		int cnt = professorManageService.updateProfessor(vo);
		logger.info("수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg = "교수정보 수정되었습니다.";
			url = "/admin/professor/professorList";
		} else {
			msg = "교수정보 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/professor/professorDelete")
	public String professorDelete(@RequestParam String profNo, Model model) {
		logger.info("교수정보 삭제");
		
		String msg = "삭제 실패", url = "/admin/professor/professorList";
		int cnt = professorManageService.deleteProfessor(profNo);
		if(cnt > 0) {
			msg = "삭제 성공!";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/chart/professorChart")
	public String professorChart() {
		logger.info("교수강의통계 화면");
		
		return "admin/chart/professorChart";
	}
}
