package com.it.every.student.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService{
	
	private final StudentDAO studentDao;

	@Override
	
	public int checkDuplicate(String userid) {
		int result = 0;
		int count = studentDao.checkDuplicate(userid);
		if(count>0) {
			result = UNUSABLE_ID;
		}else {
			result = USABLE_ID;
		}
		return result;
	}


	@Override
	public int loginProc(String userid, String pwd) {
		String dbPwd = studentDao.selectPwd(userid);
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
	public int updateStudent(StudentVO vo) {
		return studentDao.updateStudent(vo);
	}

	@Override
	public Map<String, Object> selectStudentDeptView(String userid) {
		return studentDao.selectStudentDeptView(userid);
	}

	@Override
	public List<Map<String, Object>> selectByStuId(String userid) {
		return studentDao.selectByStuId(userid);
	}

	@Override
	public Map<String, Object> selectByTuitionNo(String userid, int tuitionNo) {
		return studentDao.selectByTuitionNo(userid, tuitionNo);
	}

	@Override
	public List<Map<String, Object>> selectByScholarship(String userid) {
		return studentDao.selectByScholarship(userid);
	}


	@Override
	public StudentVO selectByid(String userid) {
		return studentDao.selectByid(userid);
	}

	@Override
	public StudentVO selectByStuNo(String stuNo) {
		return studentDao.selectByStuNo(stuNo);
	}


	@Override
	public List<StudentVO> searchForChat(String keyword) {
		return studentDao.searchForChat(keyword);
	}
}
