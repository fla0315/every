package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentRegistrationServiceImpl implements StudentRegistrationService{

	private final StudentRegistrationDAO studentRegistrationDao;

	@Override
	public List<Map<String, Object>> searchMyRegistarion(String userid) {
		return studentRegistrationDao.searchMyRegistarion(userid);
	}

	
	@Override
	public int insertMyRegistarion(RegistrationVO registrationVo) {
		return studentRegistrationDao.insertMyRegistarion(registrationVo);
	}
	
	
	
	
	
	
}
