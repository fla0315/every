package com.it.every.openSubj.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.common.RegistrationSearchVO;

@Mapper
public interface OpenSubjDAO {
	List<OpenSubjVO> selectByProfNo(String profNo); //교수가 담당하고 있는 개설과목찾기
	List<Map<String, Object>> listByProfNo(String profNo); //교수 담당 세부
	List<Map<String, Object>> checkClassRoom(String profNo); //교수별 개설교과목 강의실
	
	//개설교과과정전체조회
	List<OpenSubjVO> OpenRegistraionALL( );

	//개설교과과정전체조회 + 검색 추가하는중
	List<OpenSubjVO> OpenRegistraionALL( ); //얘는 그냥 전체 조회
	
	List<OpenSubjVO> OpenRegistraionSearch(RegistrationSearchVO regiSearchVo); //검색했을때 조회결과
	
	//학과 찾는거
	List<Map<String, Object>> selectFacultyS();
	//이수구분 찾는거
	List<Map<String, Object>> selectTypeS();
	
	
}
