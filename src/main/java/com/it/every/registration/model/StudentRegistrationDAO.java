package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.registrationCart.model.RegistrationCartVO;

@Mapper
public interface StudentRegistrationDAO {
	
	List<Map<String ,Object>> searchMyRegistarion(String userid); //수강신청내역조회
	int insertMyRegistarion(RegistrationVO registrationVo); //수강신청하기
	int deleteMyRegistarion(RegistrationVO registrationVo); //수강취소
	List<Map<String ,Object>> selectMyRegistarion(String userid); //해당학기 수강신청 내역들만 조회
	
	int insertCart(RegistrationCartVO registrationCartVo); //수강신청하기
	List<Map<String ,Object>> selectCart(String userid); //해당학기 장바구니 내역들만 조회
	int deleteCart(RegistrationCartVO registrationCartVo); //장바구니 취소
	
	List<Map<String ,Object>> selectByOpenSubCode(String openSubCode); //개설교과목별 학생목록 불러오기
}
