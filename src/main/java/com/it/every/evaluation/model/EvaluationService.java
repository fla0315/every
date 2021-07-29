package com.it.every.evaluation.model;

import java.util.List;
import java.util.Map;

import com.it.every.attendance.model.AttendanceVO;

public interface EvaluationService {
	List<EvaluationVO> selectBySubCode(String openSubCode);
	List<Map<String, Object>> selectEvaluationView(String openSubCode);
	Map<String, Object> selectBystuNo(EvaluationVO vo);
	int editBystuNo(EvaluationVO vo);
	int totalGrade(EvaluationVO vo);
	
	/*출석부 점수 반영*/
	int updateAttend(AttendanceVO vo);
}
