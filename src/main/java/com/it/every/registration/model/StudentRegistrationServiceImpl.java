package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.every.common.RegistrationSearchVO;
import com.it.every.registrationCart.model.RegistrationCartVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentRegistrationServiceImpl implements StudentRegistrationService{

	private final StudentRegistrationDAO studentRegistrationDao;

	@Override
	public List<Map<String, Object>> searchMyRegistarion(RegistrationSearchVO registrationSearchVo) {
		return studentRegistrationDao.searchMyRegistarion(registrationSearchVo);
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
	public int checkDuplicate(RegistrationVO registrationVo) {

			int count = studentRegistrationDao.checkDuplicate(registrationVo);
			
			return count;
		
	}
	
	@Override
	public List<Map<String, Object>> selectByOpenSubCode(String openSubCode) {
		return studentRegistrationDao.selectByOpenSubCode(openSubCode);
	}

	@Override
	public int checkDuplicateCart(RegistrationCartVO registrationCartVo) {
		
		int count = studentRegistrationDao.checkDuplicateCart(registrationCartVo);
		
		return count;
	}


	@Override
	public int countPersonnel(RegistrationVO registrationVo) {
		return studentRegistrationDao.countPersonnel(registrationVo);
	}


	@Override
	public int countCount(RegistrationVO registrationVo) {
		return studentRegistrationDao.countCount(registrationVo);
	}
	
	
	
	
	
	
}
