package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentRegistrationDAO {

	List<Map<String ,Object>> searchMyRegistarion(String userid);

	int insertMyRegistarion(RegistrationVO registrationVo);
}
