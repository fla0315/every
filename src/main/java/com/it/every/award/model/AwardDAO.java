package com.it.every.award.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AwardDAO {

	public List<AwardVO> selectAwardApproved(); 
	public int applyAward(AwardVO vo);
	public List<AwardVO> selectApplyList(); 
	public List<AwardVO> scholarshipList(); 
	public int scholarshipApproved(String awardNo);
	public List<Map<String, Object>> selectAwardTopFive();
	public List<Map<String, Object>> selectAwardType();
	
}
