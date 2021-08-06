package com.it.every.freepage.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface postDao {

	public int freewrite(String contents);
}
