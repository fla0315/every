package com.it.every.post.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
	private final PostDAO dao;
	
	@Override
	public int freewrite(String contents) {
		// TODO Auto-generated method stub
		return dao.freewrite(contents);
	}

}
