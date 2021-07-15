package com.it.every.tuition.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TuitionServiceImpl implements TuitionService{

	private final TuitionDAO tuitionDao;
	
	
}
