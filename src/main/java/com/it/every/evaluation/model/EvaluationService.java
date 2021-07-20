package com.it.every.evaluation.model;

import java.util.List;
import java.util.Map;

public interface EvaluationService {
	List<EvaluationVO> selectBySubCode(String openSubCode);
	List<Map<String, Object>> selectEvaluationView(String openSubCode);
	int editBystuNo(EvaluationVO vo);
}
