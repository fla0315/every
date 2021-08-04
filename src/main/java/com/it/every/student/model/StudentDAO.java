package com.it.every.student.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.assignment.model.AssignmentVO;
import com.it.every.common.RegistrationSearchVO;
import com.it.every.distributeAssign.model.DistributeAssignVO;
import com.it.every.scholarship.model.ScholarshipVO;
import com.it.every.tuition.model.TuitionVO;

@Mapper
public interface StudentDAO {
	
	StudentVO selectByid(String userid);
	StudentVO selectByStuNo(String stuNo);
	Map<String, Object> selectStudentDeptView(String userid);
	int checkDuplicate(String userid);
	String selectPwd(String userid);
	int updateStudent(StudentVO vo);

	//등록금조회
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
