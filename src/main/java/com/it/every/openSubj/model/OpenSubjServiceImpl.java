package com.it.every.openSubj.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.common.RegistrationSearchVO;
import com.it.every.common.SearchVO;

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
	public List<OpenSubjVO> OpenRegistraionALL( ) {
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

	@Override
	public List<Map<String, Object>> listByProfNo(String profNo) {
		return openSubjDao.listByProfNo(profNo);
	}

	@Override
	public List<Map<String, Object>> checkClassRoom(String profNo) {
		return openSubjDao.checkClassRoom(profNo);
	}
	public List<OpenSubjVO>  OpenRegistraionSearch(RegistrationSearchVO regiSearchVo) {
		return openSubjDao.OpenRegistraionSearch(regiSearchVo);
	}

	@Override
	public List<OpenSubjVO> boardOpenSubCode(String profNo) {
		return openSubjDao.boardOpenSubCode(profNo);
	}
	
	
	
	
	
}