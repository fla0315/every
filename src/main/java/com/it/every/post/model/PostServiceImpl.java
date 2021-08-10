package com.it.every.post.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
	private final PostDAO dao;
	
	@Override
	public int freewrite(PostVO VO) {
		// TODO Auto-generated method stub
		return dao.freewrite(VO);
	}

	@Override
	public List<PostVO> freepost() {
		// TODO Auto-generated method stub
		return dao.freepost();
	}

	@Override
	public List<PostVO> detail(int no) {
		// TODO Auto-generated method stub
		return dao.detail(no);
	}

	@Override
	public int deletepost(int a) {
		// TODO Auto-generated method stub
		return dao.deletepost(a);
	}

	

	@Override
	public int updatecount(int no) {
		// TODO Auto-generated method stub
		return dao.updatecount(no);
	}

	@Override
	public List<PostVO> mylist(String no) {
		// TODO Auto-generated method stub
		return dao.mylist(no);
	}

	@Override
	public int updatepost(PostVO vo) {
		// TODO Auto-generated method stub
		return dao.updatepost(vo);
	}

	
}
