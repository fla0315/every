package com.it.every.custompage.custommodel;

import java.util.List;
import java.util.Map;

import com.it.every.category.model.categoryVO;
import com.it.every.department.model.DepartmentVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.model.registerVO;
import com.it.every.subjType.model.SubjTypeVO;
import com.it.every.subject.model.SubjectVO;

public interface customService {


	public List<categoryVO> selectcategory(registerVO vo);
	public List<Map<String, Object>> proselectoption(String prof_no);
	public List<DepartmentVO> professordeptname(String prof_name);


	
	public List<SubjTypeVO> subjtype(customVO vo);
	public List<customVO> subjname(customVO vo);
	public int insertboard(customVO vo);
	public String adminfound(String emp_no);
	public String categorycode(String category_code);
	public List<DepartmentVO> adminsubjname();
	public List<customVO> customlist(customVO vo);
	public int deleteboard(String bd_name);
	public int checkall(customVO vo);
	
	
	public int updateboard(customVO vo);
}
