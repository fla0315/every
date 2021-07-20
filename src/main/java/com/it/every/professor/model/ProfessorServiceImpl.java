package com.it.every.professor.model;

import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProfessorServiceImpl implements ProfessorService {
	private final ProfessorDAO professorDao;
	
	@Override
	public ProfessorVO selectByid(String userid) {
		System.out.println(userid);
		return professorDao.selectByid(userid);
	}

	@Override
	public Map<String, Object> selectProfessorDeptView(String userid) {
		return professorDao.selectProfessorDeptView(userid);
	}
	
	public int checkDuplicate(String userid) {
		int result = 0;
		int count = professorDao.checkDuplicate(userid);
		if(count>0) {
			result = UNUSABLE_ID;
		}else {
			result = USABLE_ID;
		}
		return result;
	}
	
	public int loginProc(String userid, String pwd) {
		String dbPwd = professorDao.selectPwd(userid);
		int result = 0;
		
		if(dbPwd==null || dbPwd.isEmpty()) {
			result = ID_NONE;
		} else {
			if(pwd.equals(dbPwd)) {
				result = LOGIN_OK;
			}else {
				result = PWD_DISAGREE;
			}
		}
		return result;
	}

	@Override
	public int updateProf(ProfessorVO vo) {
		return professorDao.updateProf(vo);
	}
}
