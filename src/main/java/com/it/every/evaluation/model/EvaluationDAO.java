package com.it.every.evaluation.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EvaluationDAO {
	List<EvaluationVO> selectBySubCode(String openSubCode);
	List<Map<String, Object>> selectEvaluationView(String openSubCode);
	int editBystuNo(EvaluationVO vo);
}
