package com.it.every.controller;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class registerServiceIMPl implements registerService{
	
	private final registerDAO dao;

	@Override
	public int checkUserid(String userid) {
		// TODO Auto-generated method stub
		return dao.checkUserid(userid);
	}

}
