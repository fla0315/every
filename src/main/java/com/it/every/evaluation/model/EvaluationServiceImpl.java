package com.it.every.evaluation.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.attendance.model.AttendanceVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EvaluationServiceImpl implements EvaluationService {
	private final EvaluationDAO evaluationDao;

	@Override
	public List<EvaluationVO> selectBySubCode(String openSubCode) {
		return evaluationDao.selectBySubCode(openSubCode);
	}

	@Override
	public List<Map<String, Object>> selectEvaluationView(String openSubCode) {
		return evaluationDao.selectEvaluationView(openSubCode);
	}

	@Override
	public int editBystuNo(EvaluationVO vo) {
		return evaluationDao.editBystuNo(vo);
	}

	@Override
	public int updateAttend(AttendanceVO vo) {
		return evaluationDao.updateAttend(vo);
	}

}
