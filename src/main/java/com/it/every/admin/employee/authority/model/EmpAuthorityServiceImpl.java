package com.it.every.admin.employee.authority.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpAuthorityServiceImpl implements EmpAuthorityService{

	private final EmpAuthorityDAO empAuthorityDao;

	@Override
	public List<EmpAuthorityVO> selectAuthority() {
		return empAuthorityDao.selectAuthority();
	}
	
	
}
