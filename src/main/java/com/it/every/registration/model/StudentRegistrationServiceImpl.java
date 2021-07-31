package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.registrationCart.model.RegistrationCartVO;

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


	@Override
	public List<Map<String, Object>> selectMyRegistarion(String userid) {
		return studentRegistrationDao.selectMyRegistarion(userid);
	}


	@Override
	public int deleteMyRegistarion(RegistrationVO registrationVo) {
		return studentRegistrationDao.deleteMyRegistarion(registrationVo);
	}


	@Override
	public int insertCart(RegistrationCartVO registrationCartVo) {
		return studentRegistrationDao.insertCart(registrationCartVo);
	}


	@Override
	public List<Map<String, Object>> selectCart(String userid) {
		return studentRegistrationDao.selectCart(userid);
	}


	@Override
	public int deleteCart(RegistrationCartVO registrationCartVo) {
		return studentRegistrationDao.deleteCart(registrationCartVo);
	}


	@Override
	public List<Map<String, Object>> selectByOpenSubCode(String openSubCode) {
		return studentRegistrationDao.selectByOpenSubCode(openSubCode);
	}
	
	
	
	
	
	
}
