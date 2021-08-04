package com.it.every.scholarship.model;

import org.springframework.stereotype.Service;

import com.it.every.award.model.AwardVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScholarshipServiceImpl implements ScholarshipService{

	private final ScholarshipDAO scholarshipDao;

	
}
