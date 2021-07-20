package com.it.every.openSubj.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OpenSubjDAO {
	List<OpenSubjVO> selectByProfNo(String profNo); //교수가 담당하고 있는 개설과목찾기
}
