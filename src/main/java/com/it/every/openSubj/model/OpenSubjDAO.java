package com.it.every.openSubj.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.common.SearchVO;

@Mapper
public interface OpenSubjDAO {
	List<OpenSubjVO> selectByProfNo(String profNo); //교수가 담당하고 있는 개설과목찾기
	List<Map<String, Object>> listByProfNo(String profNo); //교수 담당 세부
	List<Map<String, Object>> checkClassRoom(String profNo); //교수별 개설교과목 강의실
	
	//개설교과과정전체조회
	List<OpenSubjVO> OpenRegistraionALL( );
	//학과 찾는거
	List<Map<String, Object>> selectFacultyS();
	//이수구분 찾는거
	List<Map<String, Object>> selectTypeS();
	
	
}
