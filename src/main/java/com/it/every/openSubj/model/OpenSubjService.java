package com.it.every.openSubj.model;

import java.util.List;
import java.util.Map;

import com.it.every.common.RegistrationSearchVO;
import com.it.every.common.SearchVO;

public interface OpenSubjService {
	List<OpenSubjVO> selectByProfNo(String profNo);
	List<Map<String, Object>> listByProfNo(String profNo); //교수 담당 세부
	List<Map<String, Object>> checkClassRoom(String profNo); //교수별 개설교과목 강의실

	List<OpenSubjVO> OpenRegistraionALL( ); //얘는 그냥 전체 조회
	List<OpenSubjVO> OpenRegistraionSearch(RegistrationSearchVO regiSearchVo); //검색했을때 조회결과
	
	//이수구분 찾는거
	List<Map<String, Object>> selectFacultyS();
	//이수구분 찾는거
	List<Map<String, Object>> selectTypeS();
		
}
