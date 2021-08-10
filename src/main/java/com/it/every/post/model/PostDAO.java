package com.it.every.post.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostDAO {

	public int freewrite(PostVO VO); //자유게시판 글 작성용
	public List<PostVO> freepost(); //리스트 출력용
	public List<PostVO> detail(int no); //상세보기 출력용	
	public int deletepost(int a); //삭제입력용
	public int updatecount(int no); //조회수용
	
	public List<PostVO> mylist(String no); //전체 출령굥
	public int updatepost(PostVO vo); //수정용.
	
}
