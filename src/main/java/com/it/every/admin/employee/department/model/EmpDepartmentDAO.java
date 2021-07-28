package com.it.every.admin.employee.department.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpDepartmentDAO {

	public List<EmpDepartmentVO> selectDepartment();
}
