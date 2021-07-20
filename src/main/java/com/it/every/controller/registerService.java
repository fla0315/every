package com.it.every.controller;

public interface registerService {
	//아이디 중복확인에 사용하는 상수
		public static final int USABLE_ID=1; //사용가능한 아이디
		public static final int UNUSABLE_ID=2; //이미 존재하는 아이디-사용불가

		//로그인 처리에 사용하는 상수
		int LOGIN_OK=1;  //로그인 성공
		int PWD_DISAGREE=2; //비밀번호 불일치
		int ID_NONE=3; //아이디 존재하지 않음
	
	int checkUserid(String userid);
	int checkDuplicate(String userid);
	int registerMember(registerVO vo);
	int checkDuplicatestuno(String stuno);
	int logincheck(String student_id, String pwd);
	int logincheck1(String id, String pwd);
	int logincheck2(String id, String pwd);
	int logincheck3(String id, String pwd);


}	
