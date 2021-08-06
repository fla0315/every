package com.it.every.assignment.model;

import java.util.List;
import java.util.Map;

public interface AssignmentService {
	List<AssignmentVO> showAssignment(int assignNo);
	Map<String, Object> checkAssignByStuNo(AssignmentVO vo);
	int gradeForAssign(AssignmentVO vo);
	int applyAssignEvaluation(AssignmentVO vo);
}
