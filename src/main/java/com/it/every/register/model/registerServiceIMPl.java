package com.it.every.register.model;

import org.springframework.stereotype.Service;

import com.it.every.employee.model.EmployeeVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.student.model.StudentVO;

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
	public int checkDuplicate(registerVO vo) {
		int result=0;
		
		int count = dao.checkDuplicate(vo);
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
	public int checkDuplicatestuno(registerVO vo) {
		// TODO Auto-generated method stub
		return dao.checkDuplicatestuno(vo);
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


	

	@Override
	public StudentVO selectByuserid(String id) {
		// TODO Auto-generated method stub
		return dao.selectByuserid(id);
	}

	@Override
	public ProfessorVO selectByuserid2(String id) {
		// TODO Auto-generated method stub
		return dao.selectByuserid2(id);
	}

	@Override
	public EmployeeVO selectByuserid3(String id) {
		return dao.selectByuserid3(id);
	}


}
