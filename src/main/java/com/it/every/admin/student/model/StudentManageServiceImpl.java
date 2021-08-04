package com.it.every.admin.student.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentManageServiceImpl implements StudentManageService{
	
	private final StudentManageDAO studentDao;

	@Override
	public int studentRegister(StudentManageVO vo) {
		return studentDao.studentRegister(vo);
	}

	@Override
	public List<StudentManageVO> selectAll() {
		return studentDao.selectAll();
	}

	@Override
	public StudentManageVO selectByStuNo(String stuNo) {
		return studentDao.selectByStuNo(stuNo);
	}

	@Override
	public int updateStudent(StudentManageVO vo) {
		return studentDao.updateStudent(vo);
	}

	@Override
	public int deleteStudent(String stuNo) {
		return studentDao.deleteStudent(stuNo);
	}

	@Override
	public List<StudentManageVO> selectByYear(StudentManageVO vo) {
		return studentDao.selectByYear(vo);
	}

	@Override
	public List<StudentManageVO> selectBeingInSchool() {
		return studentDao.selectBeingInSchool();
	}
	


	

}
