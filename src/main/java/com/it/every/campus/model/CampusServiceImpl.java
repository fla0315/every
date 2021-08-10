package com.it.every.campus.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CampusServiceImpl implements CampusService{

	private final CampusDAO campusDao;

	@Override
	public List<CampusVO> selectBuilding() {
		return campusDao.selectBuilding();
	}

	@Override
	public List<CampusVO> selectDepartment() {
		return campusDao.selectDepartment();
	}
	
	
}
