package com.it.every.student.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.it.every.assignment.model.AssignmentVO;
import com.it.every.common.RegistrationSearchVO;
import com.it.every.distributeAssign.model.DistributeAssignVo;
import com.it.every.scholarship.model.ScholarshipVO;
import com.it.every.tuition.model.TuitionVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService{
	private static final Logger logger = LoggerFactory.getLogger(StudentService.class);
	
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
	public List<Map<String, Object>> selectByScholarship(RegistrationSearchVO regiSearchVo) {
		return studentDao.selectByScholarship(regiSearchVo);
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


	@Override
	public String nameByStuNo(String no) {
		return studentDao.nameByStuNo(no);
	}


	@Override
	public int insertAssignment(AssignmentVO assignmentVo) {
		return studentDao.insertAssignment(assignmentVo);
	}


	@Override
	public List<Map<String, Object>> selectMyAssignmemt(DistributeAssignVo distributeAssignVo) {
		return studentDao.selectMyAssignmemt(distributeAssignVo);
	}


	@Override
	public List<Map<String, Object>> myAssignmemtList(String stuNo) {
		return studentDao.myAssignmemtList(stuNo);
	}


	@Override
	public Map<String, Object> selectByTuitionNo(TuitionVO tuitionVo) {
		return studentDao.selectByTuitionNo(tuitionVo);
	}


	@Override
	public List<Map<String, Object>> selectByScholashipNo(ScholarshipVO scholarshipVo) {
		return studentDao.selectByScholashipNo(scholarshipVo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
