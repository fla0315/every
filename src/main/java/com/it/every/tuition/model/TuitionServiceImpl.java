package com.it.every.tuition.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TuitionServiceImpl implements TuitionService{

	private final TuitionDAO tuitionDao;

	@Override
	public List<TuitionVO> selectByStuNo(String stuNo) {
		return tuitionDao.selectByStuNo(stuNo);
	}
	
	
}
