package com.it.every.tuition.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TuitionServiceImpl implements TuitionService {

	private final TuitionDAO tuitionDao;

	@Override
	public List<TuitionVO> selectTuition() {
		return tuitionDao.selectTuition();
	}

	@Override
	public List<Map<String, Object>> selectTopFive() {
		return tuitionDao.selectTopFive();
	}

	@Override
	public List<Map<String, Object>> selectFaculty() {
		return tuitionDao.selectFaculty();
	}
}
