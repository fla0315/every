package com.it.every.assignment.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AssignmentDAO {
	List<AssignmentVO> showAssignment(int assignNo);
}
