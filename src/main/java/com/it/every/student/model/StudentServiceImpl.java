package com.it.every.student.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService {

	private final StudentDAO studentDao;
	
	@Override
	public int studentRegister(StudentVO vo) {
		return studentDao.studentRegister(vo);
	}

	@Override
	public List<StudentVO> selectAll() {
		return studentDao.selectAll();
	}

	@Override
	public StudentVO selectByStuNo(String stuNo) {
		return studentDao.selectByStuNo(stuNo);
	}

	@Override
	public int updateStudent(StudentVO vo) {
		return studentDao.updateStudent(vo);
	}

	@Override
	public int deleteStudent(String stuNo) {
		return studentDao.deleteStudent(stuNo);
	}

	
}
