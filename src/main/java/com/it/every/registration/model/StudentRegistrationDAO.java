package com.it.every.registration.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.attendance.model.AttendanceVO;
import com.it.every.common.RegistrationSearchVO;
import com.it.every.evaluation.model.EvaluationVO;
import com.it.every.registrationCart.model.RegistrationCartVO;

@Mapper
public interface StudentRegistrationDAO {
	
	List<Map<String ,Object>> searchMyRegistarion(RegistrationSearchVO registrationSearchVo); //나의수강신청내역조회
	
	
	int insertMyRegistarion(RegistrationVO registrationVo); //수강신청하기
	int deleteMyRegistarion(RegistrationVO registrationVo); //수강취소
	List<Map<String ,Object>> selectMyRegistarion(String userid); //해당학기 수강신청 내역들만 조회
	
	int insertCart(RegistrationCartVO registrationCartVo); //수강신청하기
	List<Map<String ,Object>> selectCart(String userid); //해당학기 장바구니 내역들만 조회
	int deleteCart(RegistrationCartVO registrationCartVo); //장바구니 취소
	
	List<Map<String ,Object>> selectByOpenSubCode(String openSubCode); //개설교과목별 학생목록 불러오기
	//수강이력조회
	int checkDuplicate(RegistrationVO registrationVo);
	int checkDuplicateCart(RegistrationCartVO registrationCartVo);
	
	//총원 카운트
	//int countPersonnel(RegistrationVO registrationVo);
	//int countCount(RegistrationVO registrationVo);
	
	int insertAutoAttendance (AttendanceVO attendanceVo); //수강신청하면 자동으로 출석부 등록
	int insertAutoEvaluation (EvaluationVO evaluationVo); //수강신청하면 자동으로 강의 등록
	int deleteAutoAttendance (AttendanceVO attendanceVo); //출석부 자동 삭제
	int deleteAutoEvaluation (EvaluationVO evaluationVo); //강의 자동삭제
	
	
	
}
