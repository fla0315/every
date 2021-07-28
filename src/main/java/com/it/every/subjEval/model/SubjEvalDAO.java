package com.it.every.subjEval.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjEvalDAO {

	
	List<Map<String ,Object>> selectMyRegistarion(String userid); //해당학기 수강신청 내역들만 조회
	int insertSubjEvalStudent(SubjEvalVO subjEvalVo); //학생이 강의평가하기
	
	List<Map<String ,Object>> searchEvalFlag(String userid); //강의평가 유무 확인
	
	List<Map<String ,Object>> searchMyGrade(String userid); //성적조회
}
