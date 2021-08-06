package com.it.every.freepage.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class postServiceImpl implements postService {
	private final postDao dao;
	
	@Override
	public int freewrite(String contents) {
		// TODO Auto-generated method stub
		return dao.freewrite(contents);
	}

}
