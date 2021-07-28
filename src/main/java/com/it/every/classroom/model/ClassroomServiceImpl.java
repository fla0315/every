package com.it.every.classroom.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ClassroomServiceImpl implements ClassroomService {

	private final ClassroomDAO classroomDao;

	@Override
	public List<ClassroomVO> selectClassroom() {
		return classroomDao.selectClassroom();
	}

	@Override
	public List<ClassroomVO> selectUsableY() {
		return classroomDao.selectUsableY();
	}

	@Override
	public int changeUsable(String classroomCode, String usable) {
		return classroomDao.changeUsable(classroomCode, usable);
	}


	
	
	
}
