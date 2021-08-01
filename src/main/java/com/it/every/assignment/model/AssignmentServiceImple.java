package com.it.every.assignment.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AssignmentServiceImple implements AssignmentService {
	private final AssignmentDAO assignmentDao;

	@Override
	public List<AssignmentVO> showAssignment(int assignNo) {
		return assignmentDao.showAssignment(assignNo);
	}

	@Override
	public Map<String, Object> checkAssignByStuNo(AssignmentVO vo) {
		return assignmentDao.checkAssignByStuNo(vo);
	}

	@Override
	public int gradeForAssign(AssignmentVO vo) {
		return assignmentDao.gradeForAssign(vo);
	}
}
