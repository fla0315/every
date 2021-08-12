package com.it.every.lecture.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.every.classroom.model.ClassroomDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LectureServiceImpl implements LectureService {

	private static final Logger logger = LoggerFactory.getLogger(LectureServiceImpl.class);
	private final LectureDAO lectureDao;
	
	@Override
	public List<Map<String, Object>> selectLecture() {
		return lectureDao.selectLecture();
	}

	@Override
	@Transactional
	public int registerOpenSubj(LectureVO vo) {
		
		//개설교과과정 테이블 입력
		logger.info("강의개설 전 vo={}", vo);
		int cnt = lectureDao.registerOpenSubj(vo);
		
		//강의시간표 테이블 입력
		logger.info("강의개설 후 vo={}", vo);
		cnt = lectureDao.registerSubjTime(vo);
		
		return cnt;
	}

	@Override
	@Transactional
	public int editOpenSubj(LectureVO vo) {
		
		//개설교과과정 테이블 수정
		int cnt = lectureDao.editOpenSubj(vo);
		
		//강의시간표 테이블 수정
		cnt = lectureDao.editSubjTime(vo);
		
		return cnt;
	}

	@Override
	@Transactional
	public int deleteOpenSubj(String openSubCode) {
		
		//강의시간표 테이블에서 삭제
		int cnt = lectureDao.deleteSubjTime(openSubCode);

		//개설교과과목 테이블에서 삭제
		cnt = lectureDao.deleteOpenSubj(openSubCode);
		
		return cnt;
	}

	@Override
	public Map<String, String> selectByOsCode(String openSubCode) {
		return lectureDao.selectByOsCode(openSubCode);
	}

	@Override
	public List<Map<String, Object>> selectByProfNo(String profNo) {
		return lectureDao.selectByProfNo(profNo);
	}

	@Override
	public List<Map<String, Object>> selectByDeptNo(String deptNo) {
		return lectureDao.selectByDeptNo(deptNo);
	}

	@Override
	public Map<String, Object> selectScoreAvg(String openSubjCode) {
		return lectureDao.selectScoreAvg(openSubjCode);
	}

	@Override
	public List<Map<String, Object>> selectMajorCount(String openSubjCode) {
		return lectureDao.selectMajorCount(openSubjCode);
	}

	@Override
	public List<Map<String, Object>> selectGradeCount(String openSubjCode) {
		return lectureDao.selectGradeCount(openSubjCode);
	}


}
