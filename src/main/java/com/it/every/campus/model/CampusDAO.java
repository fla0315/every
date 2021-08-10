package com.it.every.campus.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CampusDAO {

	public List<CampusVO> selectBuilding();
	public List<CampusVO> selectDepartment();
}
