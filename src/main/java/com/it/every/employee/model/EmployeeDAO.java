package com.it.every.employee.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {
	List<Map<String, Object>> searchForChat(String keyword);
}
