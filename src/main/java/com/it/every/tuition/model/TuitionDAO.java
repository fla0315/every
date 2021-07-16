package com.it.every.tuition.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TuitionDAO {

	List<TuitionVO>selectByStuNo (String stuNo);
	
}
