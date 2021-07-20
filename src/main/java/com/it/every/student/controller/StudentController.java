package com.it.every.student.controller;

import java.util.List;

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

import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;
import com.it.every.student.model.StudentService;
import com.it.every.student.model.StudentVO;
import com.it.every.student.state.model.StudentStateService;
import com.it.every.student.state.model.StudentStateVO;
import com.it.every.timetable.controller.timetableController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/student")
@RequiredArgsConstructor
public class StudentController {

	private static final Logger logger 
		=LoggerFactory.getLogger(timetableController.class);
	
	private final StudentService studentService;
	private final DepartmentService departmentService;
	private final StudentStateService studentStateService;
	
	@GetMapping("/studentEdit")
	public String studentEdit(@RequestParam(defaultValue = "0") String stuNo, Model model) {
		
		logger.info("학생정보 수정 화면");
		
		StudentVO vo = studentService.selectByStuNo(stuNo);
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<StudentStateVO> stateList = studentStateService.selectAllState();
		
		logger.info("학생정보 수정 화면, 조회 결과 vo={}", vo);
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("학적상태 조회 결과, stateList.size={}", stateList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("deptList", deptList);
		model.addAttribute("stateList", stateList);
		
		return "student/studentEdit";
	}
	
	@PostMapping("/studentEdit")
	public String studentEdit_post(@ModelAttribute StudentVO vo, Model model) {
		
		logger.info("학생정보수정 처리, 파라미터 vo = {}", vo);
		
		String msg = "비밀번호 체크실패", url = "/student/studentEdit?stuNo=" + vo.getStuNo();
		int cnt = studentService.updateStudent(vo);
		logger.info("회원수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg = "회원정보 수정되었습니다.";
			url = "/admin/student/studentList";
		} else {
			msg = "회원정보 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
