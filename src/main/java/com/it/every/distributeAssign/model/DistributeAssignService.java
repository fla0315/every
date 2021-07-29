package com.it.every.distributeAssign.model;

import java.util.List;
import java.util.Map;

public interface DistributeAssignService {
	//새로운 과제 개설
	int newAssign(DistributeAssignVO vo);
	//개설된 과제 불러오기(뷰)
	List<Map<String, Object>> distributeAssignView(String profNo);	
}
