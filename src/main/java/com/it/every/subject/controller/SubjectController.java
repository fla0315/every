package com.it.every.subject.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.admin.professor.model.ProfessorManageService;
import com.it.every.admin.professor.model.ProfessorManageVO;
import com.it.every.admin.student.model.StudentManageVO;
import com.it.every.admin.student.state.model.StudentStateVO;
import com.it.every.classroom.model.ClassroomService;
import com.it.every.classroom.model.ClassroomVO;
import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;
import com.it.every.subjType.model.SubjTypeService;
import com.it.every.subjType.model.SubjTypeVO;
import com.it.every.subject.model.SubjectService;
import com.it.every.subject.model.SubjectVO;
import com.it.every.timetable.model.TimetableService;
import com.it.every.timetable.model.TimetableVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/lecture")
@RequiredArgsConstructor
public class SubjectController {

	private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);
	private final SubjectService subjectService;
	private final SubjTypeService subjTypeService;
	
	@RequestMapping("/subjectList")
	public String subjectList(Model model) {
		
		logger.info("과목관리 페이지");
		
		List<SubjectVO> list = subjectService.selectSubject();
		logger.info("과목 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/lecture/subjectList";
	}
	
	@GetMapping("/subjectRegister")
	public String subjectRegister(Model model) {
		logger.info("과목등록 화면");
		
		List<SubjTypeVO> typeList = subjTypeService.selectSubjType();
		
		logger.info("교과구분 조회 결과, typeList.size={}", typeList.size());
		
		model.addAttribute("typeList", typeList);
		
		return "admin/lecture/subjectRegister";
	}
	
	@PostMapping("/register_post")
	public String register_post(@ModelAttribute SubjectVO vo, Model model) {
		
		logger.info("과목등록 처리, 파라미터 vo={}", vo);
		
		int cnt = subjectService.registerSubject(vo);
		logger.info("과목등록 결과, cnt={}", cnt);
		
		String msg = "과목등록 실패!", url = "/admin/lecture/subjectRegister";
		if(cnt > 0) {
			msg="과목이 등록되었습니다";
			url="/admin/lecture/subjectList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/subjectEdit")
	public String subjectEdit(@RequestParam(defaultValue = "0") String subjCode, Model model) {
		
		logger.info("과목 수정 화면");
		
		SubjectVO vo = subjectService.selectBySubjCode(subjCode);
		List<SubjTypeVO> typeList = subjTypeService.selectSubjType();
		
		logger.info("학생정보 조회 결과 vo={}", vo);
		logger.info("교과구분 조회 결과, typeList.size={}", typeList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("typeList", typeList);
		
		return "admin/lecture/subjectEdit";
	}
	
	@PostMapping("/subjectEdit")
	public String subjectEdit_post(@ModelAttribute SubjectVO vo, Model model) {
		
		logger.info("과목정보수정 처리, 파라미터 vo = {}", vo);
		
		String msg = "", url = "/admin/lecture/subjectEdit?subjCode=" + vo.getSubjCode();
		int cnt = subjectService.editSubject(vo);
		logger.info("과목정보수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg = "과목정보가 수정되었습니다.";
			url = "/admin/lecture/subjectList";
		} else {
			msg = "과목정보 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/subjectDelete")
	public String studentDelete(@RequestParam String subjCode, Model model) {
		logger.info("과목정보 삭제");
		
		String msg = "삭제 실패", url = "/admin/lecture/subjectList";
		int cnt = subjectService.deleteSubject(subjCode);
		if(cnt > 0) {
			msg = "삭제 성공!";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
