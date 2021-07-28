package com.it.every.admin.employee.position.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpPositionDAO {

	public List<EmpPositionVO> selectPosition();
}
