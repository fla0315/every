package com.it.every.controller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface registerDAO {
	int checkUserid(String userid);
	int checkDuplicate(String userid);
	int registerMember(registerVO vo);
	int checkDuplicatestuno(String stuno);
	int logincheck1(String id, String pwd);
	int logincheck2(String id, String pwd);
	int logincheck3(String id, String pwd);
	String selectPwd1(String userid);
	String selectPwd2(String userid);
	String selectPwd3(String userid);
	List<registerVO> selectallstu(String userid);

	
	
	
}
