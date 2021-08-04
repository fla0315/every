package com.it.every.student.model;

import java.util.List;
import java.util.Map;

import com.it.every.assignment.model.AssignmentVO;
import com.it.every.common.RegistrationSearchVO;
import com.it.every.distributeAssign.model.DistributeAssignVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.scholarship.model.ScholarshipVO;
import com.it.every.tuition.model.TuitionVO;

public interface StudentService {

	//아이디 중복확인에 사용하는 상수
	public static final int USABLE_ID=1; //사용가능한 아이디
	public static final int UNUSABLE_ID=2; //이미 존재하는 아이디-사용불가
	
	//로그인 처리에 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	public static final int ID_NONE=3; //아이디 존재하지 않음
	
	StudentVO selectByid(String userid);
	StudentVO selectByStuNo(String stuNo);
	Map<String, Object> selectStudentDeptView(String userid);
	int checkDuplicate(String userid);
	int loginProc(String userid, String pwd);
	int updateStudent(StudentVO vo);
	
	
	//등록금 장학금 조회
	List<Map<String, Object>> selectByStuId (String userid);
	Map<String, Object> selectByTuitionNo (TuitionVO  tuitionVo); //등록금 상세조회
	//장학금조회
	List<Map<String, Object>> selectByScholarship (RegistrationSearchVO regiSearchVo);
	List<Map<String, Object>> selectByScholashipNo (ScholarshipVO scholarshipVo); //장학금 상세조회
	
	//쪽지조회
	List<StudentVO> searchForChat(String keyword);
	String nameByStuNo(String no);
	
	int insertAssignment(AssignmentVO assignmentVo); //학생 과제 등록
	List<Map<String, Object>> selectMyAssignmemt (DistributeAssignVO distributeAssignVo);
	
	List<Map<String, Object>> myAssignmemtList(String stuNo); //내가 제출한 과제들 보여주는거 
	
	
}
