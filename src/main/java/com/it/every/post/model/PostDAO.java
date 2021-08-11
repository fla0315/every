package com.it.every.post.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.boardFile.model.BoardFileVO;
import com.it.every.common.RegistrationSearchVO;

@Mapper
public interface PostDAO {

	public int freewrite(PostVO VO); //자유게시판 글 작성용
	public List<PostVO> freepost(); //리스트 출력용
	public List<Map<String,Object>> detail(int no);  //상세보기 출력용	
	public int deletepost(int a); //삭제입력용
	public int updatecount(int no); //조회수용
	
	public List<PostVO> mylist(String no); //전체 출령굥
	public int updatepost(PostVO vo); //수정용.
	
	
	
	//개설교과목공지 불러오기
	List<PostVO> postByOpenSubCode(int bdCode);
	//개설교과목 교수님별 전체 불러오기
	List<Map<String, Object>> noticeByProfNo(String profNo);
	//개설교과목공지 등록
	int insertNoitce(PostVO vo);
	//개설교과목공지 수정
	int editNotice(PostVO vo);
	//postNo로 게시글 불러오기
	Map<String, Object> postByPostNo(int postNo);
	String contentsByPostNo(int postNo);
	int noticeReadCount(int postNo);
	int deletePostByPostNo(int postNo);
	
	//거래게시판 bdCode
	int junggoBdCode();
	//거래게시판 리스트
	List<Map<String, Object>> postBybdCode(int bdCode);
	//거래게시판 상품 등록
	int insertJunggo(PostVO vo);
	int insertJunggoFile(BoardFileVO vo);
	//거래게시판에서 상품 설명 불러오는거
	Map<String,  Object> selectByJunggoPostNo(int postNo);
	int updateByJunggoPostNo(int postNo);//거래완료되면 업데이트
	
	List<Map<String, Object>> selectByNoticeStudent(RegistrationSearchVO regiVo); //학생 공지사항 조회하는거
	Map<String, Object> selectByNoticeStudentMap(int postNo); //학생 공지사항 조회하는거
	
}
