package com.it.every.post.model;

import java.util.List;
import java.util.Map;

public interface PostService {
	List<PostVO> postByOpenSubCode(int bdCode);
	int insertNoitce(PostVO vo);
	int editNotice(PostVO vo);
	Map<String, Object> postByPostNo(int postNo);
	String contentsByPostNo(int postNo);
	int noticeReadCount(int postNo);
	int deletePostByPostNo(int postNo);
}
