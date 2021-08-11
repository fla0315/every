package com.it.every.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.category.model.categoryVO;
import com.it.every.department.model.DepartmentVO;
import com.it.every.register.model.registerVO;
import com.it.every.subjType.model.SubjTypeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	private final BoardDAO boardDao;

	@Override
	public int checkBdCode(String openSubCode) {
		return boardDao.checkBdCode(openSubCode);
	}

	@Override
	public List<categoryVO> selectcategory(registerVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> proselectoption(String prof_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DepartmentVO> professordeptname(String prof_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SubjTypeVO> subjtype(customVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<customVO> subjname(customVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertboard(customVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String adminfound(String emp_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String categorycode(String category_code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DepartmentVO> adminsubjname() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<customVO> customlist(customVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteboard(String bd_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkall(customVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int category(String name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateboard(customVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String professorcalom(String no) {
		// TODO Auto-generated method stub
		return null;
	}

}
