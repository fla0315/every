package com.it.every.assignment.model;

import java.util.List;

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

}
