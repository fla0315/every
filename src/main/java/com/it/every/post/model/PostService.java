package com.it.every.post.model;

import java.util.List;
import java.util.Map;

public interface PostService {
	List<PostVO> postByOpenSubCode(int bdCode);
	int insertNoitce(PostVO vo);
	//거래게시판에서 상품 설명 불러오는거
	Map<String,  Object> selectByJunggoPostNo(int postNo);
	int updateByJunggoPostNo(int postNo);//거래완료되면 업데이트
}
