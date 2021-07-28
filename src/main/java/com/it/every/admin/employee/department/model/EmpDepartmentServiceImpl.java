package com.it.every.admin.employee.department.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpDepartmentServiceImpl implements EmpDepartmentService {

	private final EmpDepartmentDAO departmentDao;
	
	@Override
	public List<EmpDepartmentVO> selectDepartment() {
		return departmentDao.selectDepartment();
	}

}
