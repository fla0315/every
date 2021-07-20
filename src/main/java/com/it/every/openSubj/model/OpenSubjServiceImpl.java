package com.it.every.openSubj.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OpenSubjServiceImpl implements OpenSubjService {
	private final OpenSubjDAO openSubjDao;
		
	@Override
	public List<OpenSubjVO> selectByProfNo(String profNo) {
		return openSubjDao.selectByProfNo(profNo);
	}
	
	@Override
	public List<OpenSubjVO> selectScholarALL() {
		return openSubjDao.selectScholarALL();
	}
}