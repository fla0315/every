package com.it.every.admin.employee.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.admin.employee.authority.model.EmpAuthorityService;
import com.it.every.admin.employee.authority.model.EmpAuthorityVO;
import com.it.every.admin.employee.department.model.EmpDepartmentService;
import com.it.every.admin.employee.department.model.EmpDepartmentVO;
import com.it.every.admin.employee.model.EmployeeManageService;
import com.it.every.admin.employee.model.EmployeeManageVO;
import com.it.every.admin.employee.position.model.EmpPositionService;
import com.it.every.admin.employee.position.model.EmpPositionVO;
import com.it.every.admin.professor.model.ProfessorManageVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class EmployeeManageController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeManageController.class);
	private final EmployeeManageService employeeManageService;
	private final EmpDepartmentService empDepartmentService;
	private final EmpPositionService empPositionService;
	private final EmpAuthorityService empAuthorityService;
	
	@RequestMapping("/employee/employeeList")
	public String employeeList(Model model) {
		logger.info("임직원조회 화면");
		
		List<EmployeeManageVO> list = employeeManageService.selectAll();
		logger.info("조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/employee/employeeList";
	}
	
	@RequestMapping("/employee/employeeRegister")
	public String employeeRegister(Model model) {
		logger.info("임직원등록 화면");
		
		List<EmpDepartmentVO> deptList = empDepartmentService.selectDepartment();
		List<EmpPositionVO> posList = empPositionService.selectPosition();
		List<EmpAuthorityVO> authList = empAuthorityService.selectAuthority();
		
		logger.info("부서 조회 결과, deptList={}", deptList);
		logger.info("직책 조회 결과, posList={}", posList);
		logger.info("권한 조회 결과, authList={}", authList);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("authList", authList);
		
		return "admin/employee/employeeRegister";
	}
	
	@PostMapping("/employee/register_post")
	public String register_post(@ModelAttribute EmployeeManageVO vo, Model model) {
		
		logger.info("직원등록 처리, 파라미터 vo={}", vo);
		
		int cnt = employeeManageService.employeeRegister(vo);
		logger.info("직원등록 결과, cnt={}", cnt);
		
		String msg = "직원등록 실패!", url = "/admin/employee/employeeRegister";
		if(cnt > 0) {
			msg="직원정보가 등록되었습니다";
			url="/admin/employee/employeeList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/employee/employeeEdit")
	public String employeeEdit(@RequestParam(defaultValue = "0") String empNo, Model model) {
		logger.info("임직원정보 수정 화면");
		
		EmployeeManageVO vo = employeeManageService.selectByEmpNo(empNo);
		List<EmpDepartmentVO> deptList = empDepartmentService.selectDepartment();
		List<EmpPositionVO> posList = empPositionService.selectPosition();
		List<EmpAuthorityVO> authList = empAuthorityService.selectAuthority();
		
		logger.info("임직원정보 조회 결과, vo={}", vo);
		logger.info("부서 조회 결과, deptList={}", deptList);
		logger.info("직책 조회 결과, posList={}", posList);
		logger.info("권한 조회 결과, authList={}", authList);
		
		model.addAttribute("vo", vo);
		model.addAttribute("deptList", deptList);
		model.addAttribute("posList", posList);
		model.addAttribute("authList", authList);
		
		return "admin/employee/employeeEdit";
	}
	
	@PostMapping("/employee/employeeEdit")
	public String employeeEdit_post(@ModelAttribute EmployeeManageVO vo, Model model) {
		
		logger.info("임직원정보수정 처리, 파라미터 vo={}", vo);
		
		String msg = "비밀번호 체크실패", url = "/admin/employee/employeeEdit?empNo=" + vo.getEmpNo();
		int cnt = employeeManageService.updateEmployee(vo);
		logger.info("수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg = "임직원정보 수정되었습니다.";
			url = "/admin/employee/employeeList";
		} else {
			msg = "임직원정보 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "common/message";
	}
	
	@RequestMapping("/employee/employeeDelete")
	public String employeeDelete(@RequestParam String empNo, Model model) {
		logger.info("임직원정보 삭제");
		
		String msg = "삭제 실패", url = "/admin/employee/employeeList";
		int cnt = employeeManageService.deleteEmployee(empNo);
		if(cnt > 0) {
			msg = "삭제 성공!";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
