package com.it.every.employee.model;

import java.util.List;
import java.util.Map;

public interface employeeService {
	List<Map<String, Object>> searchForChat(String keyword);
	String nameByEmpNo(String no);
}
