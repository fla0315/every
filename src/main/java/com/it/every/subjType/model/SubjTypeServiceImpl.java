package com.it.every.subjType.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SubjTypeServiceImpl implements SubjTypeService{

	private final SubjTypeDAO subjTypeDao;

	@Override
	public List<SubjTypeVO> selectSubjType() {
		return subjTypeDao.selectSubjType();
	}
	
	
}
