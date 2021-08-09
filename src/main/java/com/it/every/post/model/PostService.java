package com.it.every.post.model;

import java.util.List;

public interface PostService {
	List<PostVO> postByOpenSubCode(int bdCode);
	int insertNoitce(PostVO vo);
	//거래게시판에서 상품 설명 불러오는거
	PostVO selectByJunggoPostNo(int postNo);
}
