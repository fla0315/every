package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

public interface StudentRegistrationService {

	
	List<Map<String ,Object>> searchMyRegistarion(String userid);
	
	int insertMyRegistarion(RegistrationVO registrationVo);
}
