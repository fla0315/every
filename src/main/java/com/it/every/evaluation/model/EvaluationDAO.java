package com.it.every.evaluation.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.attendance.model.AttendanceVO;

@Mapper
public interface EvaluationDAO {
	List<EvaluationVO> selectBySubCode(String openSubCode);
	List<Map<String, Object>> selectEvaluationView(String openSubCode);
	int editBystuNo(EvaluationVO vo);
	
	/*출석부 점수 반영*/
	int updateAttend(AttendanceVO vo);
}
