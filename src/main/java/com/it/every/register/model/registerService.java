package com.it.every.register.model;

import com.it.every.employee.model.EmployeeVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.student.model.StudentVO;

public interface registerService {
	//아이디 중복확인에 사용하는 상수
		public static final int USABLE_ID=1; //사용가능한 아이디
		public static final int UNUSABLE_ID=2; //이미 존재하는 아이디-사용불가, 로그인시에는 가능

		//로그인 처리에 사용하는 상수
		int LOGIN_OK=1;  //로그인 성공
		int PWD_DISAGREE=2; //비밀번호 불일치
		int ID_NONE=3; //아이디 존재하지 않음
	
	int checkUserid(String userid);
	int checkDuplicate(registerVO vo);
	int registerMember(registerVO vo);
	int checkDuplicatestuno(registerVO vo);

	
	//어쩔수가 없다 자꾸 결과가 달라
	int logincheck1(String id, String pwd);
	int logincheck2(String id, String pwd);
	int logincheck3(String id, String pwd);
	public StudentVO selectByuserid(String id); 
	public ProfessorVO selectByuserid2(String id); 
	public EmployeeVO selectByuserid3(String id); 
	
	public int checkalready(registerVO vo);
	int checkalready1(registerVO vo);
	int checkalready2(registerVO vo);
	int checkalready3(registerVO vo);

	 int checkphonenum(registerVO vo);
	 int professorchkemail(registerVO vo); //이메일 중복확인
	 

}	
