package com.it.every.admin.employee.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeManageDAO {

	public int employeeRegister(EmployeeManageVO vo);
	public List<EmployeeManageVO> selectAll();
	public EmployeeManageVO selectByEmpNo(String empNo);
	public int updateEmployee(EmployeeManageVO vo);
	public int deleteEmployee(String empNo);
}
