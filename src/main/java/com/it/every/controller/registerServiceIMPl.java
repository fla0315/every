package com.it.every.controller;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class registerServiceIMPl implements registerService{
	
	private final registerDAO dao;

	@Override
	public int checkUserid(String userid) {
		// TODO Auto-generated method stub
		return dao.checkUserid(userid);
	}

	@Override
	public int checkDuplicate(String userid) {
		int result=0;
		
		int count = dao.checkDuplicate(userid);
		if(count>0) {
			result=UNUSABLE_ID;
		}else {
			result=USABLE_ID;
		}
		
		return result;
	}

	@Override
	public int registerMember(registerVO vo) {
		// TODO Auto-generated method stub
		
		return dao.registerMember(vo);
	}

	@Override
	public int checkDuplicatestuno(String stuno) {
		// TODO Auto-generated method stub
		return dao.checkDuplicatestuno(stuno);
	}

	@Override
	public int logincheck(String student_id, String pwd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int logincheck1(String id, String pwd) {
		String dbPwd=dao.selectPwd1(id);
		int result=0;
		if(dbPwd == null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}
		
		return result;		
	}

	@Override
	public int logincheck2(String id, String pwd) {
		String dbPwd=dao.selectPwd2(id);
		int result=0;
		if(dbPwd == null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}
		
		return result;		
	}

	@Override
	public int logincheck3(String id, String pwd) {
		String dbPwd=dao.selectPwd3(id);
		int result=0;
		if(dbPwd == null || dbPwd.isEmpty()) {
			result=ID_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}
		
		return result;		
	}

	

}
