package com.it.every.distributeAssign.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DistributeAssignDAO {
	//새로운 과제 개설
	int newAssign(DistributeAssignVO vo);
	//개설된 과제 불러오기(뷰)
	List<Map<String, Object>> distributeAssignView(Map<String, Object> map);	
}
