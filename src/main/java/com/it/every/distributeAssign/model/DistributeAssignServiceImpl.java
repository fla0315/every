package com.it.every.distributeAssign.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DistributeAssignServiceImpl implements DistributeAssignService{
	private final DistributeAssignDAO distributeAssignDao;
	
	@Override
	public int newAssign(DistributeAssignVO vo) {
		return distributeAssignDao.newAssign(vo);
	}

	@Override
	public List<Map<String, Object>> distributeAssignView(String profNo) {
		return distributeAssignDao.distributeAssignView(profNo);
	}
}
