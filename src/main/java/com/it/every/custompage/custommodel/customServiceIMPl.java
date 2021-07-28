package com.it.every.custompage.custommodel;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.category.model.categoryVO;
import com.it.every.department.model.DepartmentVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.model.registerVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class customServiceIMPl implements customService {

	private final customDAO dao;

	@Override
	public List<String> selectcategory(registerVO vo){
		// TODO Auto-generated method stub
		return dao.selectcategory(vo);
	}

	@Override
	public List<Map<String, Object>> proselectoption(String prof_no) {
		// TODO Auto-generated method stub
		return dao.proselectoption(prof_no);
	}

	@Override
	public List<DepartmentVO> professordeptname(String prof_name) {
		// TODO Auto-generated method stub
		return dao.professordeptname(prof_name);
	}

	@Override
	public List<DepartmentVO> admincustompage() {
		// TODO Auto-generated method stub
		return dao.admincustompage();
	}

	/*
	 * @Override public List<Map<String, Object>> adminselectoption(String admin_no)
	 * { // TODO Auto-generated method stub return dao.adminselectoption(admin_no);
	 * }
	 * 
	 */
	
	
}
