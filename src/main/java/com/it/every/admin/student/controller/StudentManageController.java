package com.it.every.admin.student.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.admin.student.model.StudentManageService;
import com.it.every.admin.student.model.StudentManageVO;
import com.it.every.admin.student.state.model.StudentStateService;
import com.it.every.admin.student.state.model.StudentStateVO;
import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class StudentManageController {

	private static final Logger logger = LoggerFactory.getLogger(StudentManageController.class);
	private final StudentManageService studentManageService;
	private final DepartmentService departmentService;
	private final StudentStateService studentStateService;
	
	@GetMapping("/student/studentList")
	public String studentList(Model model) {
		logger.info("학생조회 화면");
		
		List<StudentManageVO> list = studentManageService.selectAll();
		logger.info("목록 결과, list.size={}", list.size());
		
		//3
		model.addAttribute("list", list);
		
		return "admin/student/studentList";
	}
	
	@GetMapping("/student/studentRegister")
	public String studentRegister(Model model) {
		logger.info("학생등록 화면 호출");
		
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<StudentStateVO> stateList = studentStateService.selectAllState();
		
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("학적상태 조회 결과, stateList.size={}", stateList.size());
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("stateList", stateList);
		
		return "admin/student/studentRegister";
	}
	
	@PostMapping("/student/register_post")
	public String register_post(@ModelAttribute StudentManageVO vo, Model model) {
		
		logger.info("학생등록 처리, 파라미터 vo={}", vo);
		
		String stuNo = "";
		String admissionYear = vo.getAdmissionYear();
		vo.setAdmissionYear(admissionYear);
		String deptNo = String.format("%02d", vo.getDeptNo());
		String major = vo.getMajor();
		logger.info("파라미터 admissionYear={}", admissionYear);
		logger.info("파라미터 deptNo={}", deptNo);
		logger.info("파라미터 major={}", major);
		
		/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("admissionYear", admissionYear);
		map.put("major", major);
		
		logger.info("admissionYear value={}", (String) map.get("admissionYear"));
		logger.info("major value={}", (String) map.get("major"));
		*/
		
		List<StudentManageVO> list 
			= studentManageService.selectByYear(vo);
		logger.info("해당년도 등록학생 수 : list.size = {}", list.size());
		
		int num = list.size() + 1;
		String castNum = String.format("%03d", num);
		
		stuNo = admissionYear + deptNo + castNum;
		logger.info("stuNo={}", stuNo);
		
		vo.setStuNo(stuNo);
		
		int cnt = studentManageService.studentRegister(vo);
		logger.info("학생등록 결과, cnt={}", cnt);
		
		String msg = "학생등록 실패!", url = "/admin/student/studentRegister";
		if(cnt > 0) {
			msg="학생이 등록되었습니다";
			url="/admin/student/studentList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/student/studentEdit")
	public String studentEdit(@RequestParam(defaultValue = "0") String stuNo, Model model) {
		
		logger.info("학생정보 수정 화면");
		
		StudentManageVO vo = studentManageService.selectByStuNo(stuNo);
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<StudentStateVO> stateList = studentStateService.selectAllState();
		
		logger.info("학생정보 수정 화면, 조회 결과 vo={}", vo);
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("학적상태 조회 결과, stateList.size={}", stateList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("deptList", deptList);
		model.addAttribute("stateList", stateList);
		
		return "admin/student/studentEdit";
	}
	
	@PostMapping("/student/studentEdit")
	public String studentEdit_post(@ModelAttribute StudentManageVO vo, Model model) {
		
		logger.info("학생정보수정 처리, 파라미터 vo = {}", vo);
		
		String msg = "비밀번호 체크실패", url = "/admin/student/studentEdit?stuNo=" + vo.getStuNo();
		int cnt = studentManageService.updateStudent(vo);
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
	
	@GetMapping("/student/studentDelete")
	public String studentDelete(@RequestParam String stuNo, Model model) {
		logger.info("학생정보 삭제");
		
		String msg = "삭제 실패", url = "/admin/student/studentList";
		int cnt = studentManageService.deleteStudent(stuNo);
		if(cnt > 0) {
			msg = "삭제 성공!";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@GetMapping("/chart/studentChart")
	public String studentChart() {
		logger.info("학생성적통계 화면");
		
		return "admin/chart/studentChart";
	}
	
	@GetMapping("/chart/majorStuChart")
	public String majorStuChart() {
		logger.info("학과별 학생통계 화면");
		
		return "admin/chart/majorStuChart";
	}
	
	@GetMapping("/student/tuitionManage")
	public String tuitionManage() {
		logger.info("등록금관리 화면");
		
		return "admin/student/tuitionManage";
	}
	
	@GetMapping("/student/scholarshipManage")
	public String scholarshipManage() {
		logger.info("장학금관리 화면");
		
		return "admin/student/scholarshipManage";
	}
	
}
