package com.it.every.student.model;

import java.util.List;
import java.util.Map;

import com.it.every.professor.model.ProfessorVO;

public interface StudentService {

	//아이디 중복확인에 사용하는 상수
	public static final int USABLE_ID=1; //사용가능한 아이디
	public static final int UNUSABLE_ID=2; //이미 존재하는 아이디-사용불가
	
	//로그인 처리에 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	public static final int ID_NONE=3; //아이디 존재하지 않음
	
	StudentVO selectByid(String userid);
	Map<String, Object> selectStudentDeptView(String userid);
	int checkDuplicate(String userid);
	int loginProc(String userid, String pwd);
	int updateStudent(StudentVO vo);
	
	//등록금 장학금 조회
	List<Map<String, Object>> selectByStuId (String userid);
	Map<String, Object> selectByTuitionNo (String userid ,int tuitionNo);
	List<Map<String, Object>> selectByScholarship (String userid);
	
	
}
