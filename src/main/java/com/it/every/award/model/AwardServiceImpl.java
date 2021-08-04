package com.it.every.award.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AwardServiceImpl implements AwardService {

	private final AwardDAO awardDao;

	@Override
	public List<AwardVO> selectAwardApproved() {
		return awardDao.selectAwardApproved();
	}

	@Override
	public int applyAward(AwardVO vo) {
		return awardDao.applyAward(vo);
	}

	@Override
	public List<AwardVO> selectApplyList() {
		return awardDao.selectApplyList();
	}

	@Override
	public List<AwardVO> scholarshipList() {
		return awardDao.scholarshipList();
	}

	@Override
	public int scholarshipApproved(String awardNo) {
		return awardDao.scholarshipApproved(awardNo);
	}

	@Override
	public List<Map<String, Object>> selectAwardTopFive() {
		return awardDao.selectAwardTopFive();
	}

	@Override
	public List<Map<String, Object>> selectAwardType() {
		return awardDao.selectAwardType();
	}
	
	
}
