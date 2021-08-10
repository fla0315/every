package com.it.every.post.model;

import java.util.List;
import java.util.Map;

import com.it.every.board.model.BoardVO;
import com.it.every.boardFile.model.BoardFileVO;
import com.it.every.common.RegistrationSearchVO;

public interface PostService {
	List<PostVO> postByOpenSubCode(int bdCode);
	List<Map<String, Object>> noticeByProfNo(String profNo);
	int insertNoitce(PostVO vo);
	int editNotice(PostVO vo);
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

	public int freewrite(PostVO VO);
	public List<PostVO> freepost(); //리스트 출력용
	public List<PostVO> detail(int no); //상세보기 출력용	
	public int deletepost(int a);

	public int updatecount(int no);
	public List<PostVO> mylist(String no);
	public int updatepost(PostVO vo);


}
