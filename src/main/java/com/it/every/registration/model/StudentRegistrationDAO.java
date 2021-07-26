package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentRegistrationDAO {

	List<Map<String ,Object>> searchMyRegistarion(String userid); //수강신청내역조회
	int insertMyRegistarion(RegistrationVO registrationVo); //수강신청하기
	int deleteMyRegistarion(RegistrationVO registrationVo); //수강취소
	List<Map<String ,Object>> selectMyRegistarion(String userid); //해당학기 수강신청 내역들만 조회
	
}
