package com.it.every.openSubj.model;

import java.util.List;
import java.util.Map;

import com.it.every.common.SearchVO;

public interface OpenSubjService {
	List<OpenSubjVO> selectByProfNo(String profNo);
	List<Map<String, Object>> listByProfNo(String profNo); //교수 담당 세부

	List<OpenSubjVO> OpenRegistraionALL( );
	
	//이수구분 찾는거
	List<Map<String, Object>> selectFacultyS();
	//이수구분 찾는거
	List<Map<String, Object>> selectTypeS();
		
}
