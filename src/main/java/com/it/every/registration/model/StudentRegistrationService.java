package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

public interface StudentRegistrationService {
	
	List<Map<String ,Object>> searchMyRegistarion(String userid);
	int insertMyRegistarion(RegistrationVO registrationVo);
	int deleteMyRegistarion(RegistrationVO registrationVo); //수강취소
	List<Map<String ,Object>> selectMyRegistarion(String userid); //해당학기 수강신청 내역들만 조회
	
	
	
	
}
