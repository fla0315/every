package com.it.every.custompage.custommodel;

import java.util.List;
import java.util.Map;

import com.it.every.category.model.categoryVO;
import com.it.every.department.model.DepartmentVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.model.registerVO;

public interface customService {


	public List<String> selectcategory(registerVO vo);
	public List<Map<String, Object>> proselectoption(String prof_no);
	public List<DepartmentVO> professordeptname(String prof_name);
	public List<DepartmentVO> admincustompage();
	/* public List<Map<String, Object>> adminselectoption(String admin_no); */
	
}
