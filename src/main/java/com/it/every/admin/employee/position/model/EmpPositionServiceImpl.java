package com.it.every.admin.employee.position.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpPositionServiceImpl implements EmpPositionService{
	
	private final EmpPositionDAO empPositionDao;

	@Override
	public List<EmpPositionVO> selectPosition() {
		return empPositionDao.selectPosition();
	}
}
