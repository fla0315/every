package com.it.every.controller;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface registerDAO {
	int checkUserid(String userid);
}
