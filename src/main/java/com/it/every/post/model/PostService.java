package com.it.every.post.model;

import java.util.List;

public interface PostService {

	public int freewrite(PostVO VO);
	public List<PostVO> freepost(); //리스트 출력용
	public List<PostVO> detail(int no); //상세보기 출력용	
	public int deletepost(int a);

	public int updatecount(int no);
	public List<PostVO> mylist(String no);
	public int updatepost(PostVO vo);
	

}
