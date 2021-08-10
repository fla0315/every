package com.it.every.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.category.model.categoryVO;
import com.it.every.department.model.DepartmentVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.model.registerVO;
import com.it.every.subjType.model.SubjTypeVO;
import com.it.every.subject.model.SubjectVO;

@Mapper
public interface BoardDAO {

	public List<categoryVO> selectcategory(registerVO vo); //카테고리 불러오기용
	public List<Map<String, Object>> proselectoption(String prof_no); //교수 수업 검색(ajax)
	public List<DepartmentVO> professordeptname(String prof_name); //교수 학과명 불러오기용
	

	public List<SubjTypeVO> subjtype(customVO vo); //교수 이수구분 불러오기용
	
	public List<customVO> subjname(customVO vo); //교수 수업 불러오기용
	public int insertboard(customVO vo); //게시판 작성용
	public String adminfound(String emp_no); //생성 페이지 진입시 교수랑 관리자 차이두기
	public String categorycode(String category_code); //게시판 저장 시 카테고리 번호 전황용()
	public List<DepartmentVO> adminsubjname(); //관리자는 수업이 등록된 모든 학과 검색 가능
	public List<customVO> customlist(customVO vo); //리스트 불러오기용
	public int deleteboard(String bd_name); //게시판 미사용 저장용
	public int checkall(customVO vo); //진행중(아직 미완성)
	public int category(String name); // 중복기능이지만 시간상 통합페스
	
	
	public int updateboard(customVO vo); //게시판 옵션 수정용
	public String professorcalom(String no); //게시판 생성 시 교수는 학과 선택 x
	
	int checkBdCode(String openSubCode);



}