package com.it.every.admin.employee.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeManageServiceImpl implements EmployeeManageService{

	private final EmployeeManageDAO employeeManageDao;
	
	@Override
	public int employeeRegister(EmployeeManageVO vo) {
		return employeeManageDao.employeeRegister(vo);
	}

	@Override
	public List<EmployeeManageVO> selectAll() {
		return employeeManageDao.selectAll();
	}

	@Override
	public EmployeeManageVO selectByEmpNo(String empNo) {
		return employeeManageDao.selectByEmpNo(empNo);
	}

	@Override
	public int updateEmployee(EmployeeManageVO vo) {
		return employeeManageDao.updateEmployee(vo);
	}

	@Override
	public int deleteEmployee(String empNo) {
		return employeeManageDao.deleteEmployee(empNo);
	}

}
