package com.it.every.openSubj.model;

import java.util.List;
import java.util.Map;

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
	public List<OpenSubjVO> OpenRegistraionALL() {
		return openSubjDao.OpenRegistraionALL();
	}

	@Override
	public List<Map<String, Object>> selectFacultyS() {
		return openSubjDao.selectFacultyS();
	}

	@Override
	public List<Map<String, Object>> selectTypeS() {
		return openSubjDao.selectTypeS();
	}
}