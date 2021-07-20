package com.it.every.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class EmployeeManageController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeManageController.class);
	
	
	@RequestMapping("/employee/employeeList")
	public String employeeList() {
		logger.info("임직원조회 화면");
		
		return "admin/employee/employeeList";
	}
	
	@RequestMapping("/employee/employeeRegister")
	public String employeeRegister() {
		logger.info("임직원등록 화면");
		
		return "admin/employee/employeeRegister";
	}
	
	@RequestMapping("/employee/employeeEdit")
	public String employeeEdit() {
		logger.info("임직원정보 수정 화면");
		
		return "admin/employee/employeeEdit";
	}
	
	@RequestMapping("/employee/employeeDelete")
	public String employeeDelete() {
		logger.info("임직원정보 삭제");
		
		return "admin/employee/employeeDelete";
	}
}
