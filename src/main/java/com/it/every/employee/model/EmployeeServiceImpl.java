package com.it.every.employee.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements employeeService {
	private final EmployeeDAO employeeDao;

	@Override
	public List<Map<String, Object>> searchForChat(String keyword) {
		return employeeDao.searchForChat(keyword);
	}

	@Override
	public String nameByEmpNo(String no) {
		return employeeDao.nameByEmpNo(no);
	}
	
}
