package com.it.every.admin.employee.model;

import java.util.List;

public interface EmployeeManageService {

	public int employeeRegister(EmployeeManageVO vo);
	public List<EmployeeManageVO> selectAll();
	public EmployeeManageVO selectByEmpNo(String empNo);
	public int updateEmployee(EmployeeManageVO vo);
	public int deleteEmployee(String empNo);
}
