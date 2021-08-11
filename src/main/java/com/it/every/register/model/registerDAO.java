package com.it.every.register.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.employee.model.EmployeeVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.student.model.StudentVO;

@Mapper
public interface registerDAO {
	int checkUserid(String userid);
	int checkDuplicate(registerVO vo);
	int registerMember(registerVO vo);
	String logincheck(registerVO vo);
	List<registerVO> selectallstu(String userid);
	int checkDuplicatestuno(registerVO vo);
	
	//이것만큼은 어쩔수가 없다!
		String selectPwd1(String userid);
		String selectPwd2(String userid);
		String selectPwd3(String userid);
	
		public StudentVO selectByuserid(String id); 
		public ProfessorVO selectByuserid2(String id); 
		public EmployeeVO selectByuserid3(String id); 
		
		//회원가입 확인용
		public int checkalready(registerVO vo);

		
		int checkalready1(registerVO vo);
		int checkalready2(registerVO vo);
		int checkalready3(registerVO vo);
		
	 int checkphonenum(registerVO vo); //전화번호 중복확인
	 int professorchkemail(registerVO vo); //이메일 중복확인
	 
	 
	 


}
