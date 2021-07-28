package com.it.every.admin.employee.authority.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpAuthorityDAO {

	public List<EmpAuthorityVO> selectAuthority();
}
