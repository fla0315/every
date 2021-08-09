package com.it.every.post.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostDAO {
	//개설교과목공지 불러오기
	List<PostVO> postByOpenSubCode(int bdCode);
	//개설교과목공지 등록
	int insertNoitce(PostVO vo);
	//개설교과목공지 수정
	int editNotice(PostVO vo);
	//postNo로 게시글 불러오기
	Map<String, Object> postByPostNo(int postNo);
	String contentsByPostNo(int postNo);
	int noticeReadCount(int postNo);
	int deletePostByPostNo(int postNo);
}
