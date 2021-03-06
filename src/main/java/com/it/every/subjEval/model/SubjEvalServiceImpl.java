package com.it.every.subjEval.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SubjEvalServiceImpl implements SubjEvalService{
	
	
	private final SubjEvalDAO subjEvalDao;

	@Override
	public List<Map<String, Object>> selectMyRegistarion(String userid) {
		return subjEvalDao.selectMyRegistarion(userid);
	}

	@Override
	public int insertSubjEvalStudent(SubjEvalVO subjEvalVo) {
		return subjEvalDao.insertSubjEvalStudent(subjEvalVo);
	}

	@Override
	public List<Map<String, Object>> searchEvalFlag(String userid) {
		return subjEvalDao.searchEvalFlag(userid);
	}

	@Override
	public List<Map<String, Object>> searchMyGrade(String userid) {
		return subjEvalDao.searchMyGrade(userid);
	}

	@Override
	public int updateEvalFlag(SubjEvalVO subjEvalVo) {
		return subjEvalDao.updateEvalFlag(subjEvalVo);
	}
	
	
	
	
	
}
