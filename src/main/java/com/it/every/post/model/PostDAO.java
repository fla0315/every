package com.it.every.post.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostDAO {
	//개설교과목공지 불러오기
	List<PostVO> postByOpenSubCode(int bdCode);
	//개설교과목공지 등록
	int insertNoitce(PostVO vo);
	
	//거래게시판에서 상품 설명 불러오는거
	PostVO selectByJunggoPostNo(int postNo);
	
	
}
