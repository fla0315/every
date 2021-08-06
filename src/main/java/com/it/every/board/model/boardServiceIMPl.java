package com.it.every.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.category.model.categoryVO;
import com.it.every.department.model.DepartmentVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.model.registerVO;
import com.it.every.subjType.model.SubjTypeVO;
import com.it.every.subject.model.SubjectVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class boardServiceIMPl implements boardService {

	private final BoardDAO dao;

	@Override
	public List<categoryVO> selectcategory(registerVO vo){
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
	public List<SubjTypeVO> subjtype(customVO vo) {
		// TODO Auto-generated method stub
		return dao.subjtype(vo);
	}

	@Override
	public List<customVO> subjname(customVO vo) {
		// TODO Auto-generated method stub
		return dao.subjname(vo);
	}

	@Override
	public int insertboard(customVO vo) {
		// TODO Auto-generated method stub
		return dao.insertboard(vo);
	}

	@Override
	public String adminfound(String emp_no) {
		// TODO Auto-generated method stub
		return dao.adminfound(emp_no);
	}

	@Override
	public String categorycode(String category_code) {
		// TODO Auto-generated method stub
		return dao.categorycode(category_code);
	}

	@Override
	public List<DepartmentVO> adminsubjname() {
		// TODO Auto-generated method stub
		return dao.adminsubjname();
	}

	@Override
	public List<customVO> customlist(customVO vo) {
		// TODO Auto-generated method stub
		return dao.customlist(vo);
	}

	@Override
	public int deleteboard(String bd_name) {
		// TODO Auto-generated method stub
		return dao.deleteboard(bd_name);
	}

	@Override
	public int updateboard(customVO vo) {
		// TODO Auto-generated method stub
		return dao.updateboard(vo);
	}

	@Override
	public int checkall(customVO vo) {
		// TODO Auto-generated method stub
		return dao.checkall(vo);
	}

	@Override
	public int category(String name) {
		// TODO Auto-generated method stub
		return dao.category(name);
	}

	

	
	
	
}
