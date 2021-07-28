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
	private final ClassroomDAO classroomDao;
	
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
		
		//강의실 사용가능여부 변경
		String usable = "Y";
		if(cnt > 0) {
			usable = "N";
		} 
		cnt = classroomDao.changeUsable(vo.getClassroomCode(), usable);
		
		return cnt;
	}

}
