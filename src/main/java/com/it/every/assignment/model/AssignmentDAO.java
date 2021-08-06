package com.it.every.assignment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AssignmentDAO {
	List<AssignmentVO> showAssignment(int assignNo);
	Map<String, Object> checkAssignByStuNo(AssignmentVO vo);
	int gradeForAssign(AssignmentVO vo);
	int applyAssignEvaluation(AssignmentVO vo);
}
