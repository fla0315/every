package com.it.every.syllabus.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SyllabusServiceImpl implements SyllabusService {
	private final SyllabusDAO syllabusDao;

	@Override
	public List<Map<String, Object>> checkSyllabusList(String profNo) {
		return syllabusDao.checkSyllabusList(profNo);
	}

	@Override
	public int insertSyllabus(SyllabusVO vo) {
		return syllabusDao.insertSyllabus(vo);
	}

	@Override
	public SyllabusVO checkSyllabus(String openSubCode) {
		return syllabusDao.checkSyllabus(openSubCode);
	}
}
