package com.it.every.post.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.boardFile.model.BoardFileVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
	private final PostDAO postDao;

	@Override
	public List<PostVO> postByOpenSubCode(int bdCode) {
		return postDao.postByOpenSubCode(bdCode);
	}

	@Override
	public int insertNoitce(PostVO vo) {
		return postDao.insertNoitce(vo);
	}

	@Override
	public Map<String, Object> postByPostNo(int postNo) {
		return postDao.postByPostNo(postNo);
	}

	@Override
	public String contentsByPostNo(int postNo) {
		return postDao.contentsByPostNo(postNo);
	}

	@Override
	public int noticeReadCount(int postNo) {
		return postDao.noticeReadCount(postNo);
	}

	@Override
	public int deletePostByPostNo(int postNo) {
		return postDao.deletePostByPostNo(postNo);
	}

	@Override
	public int editNotice(PostVO vo) {
		return postDao.editNotice(vo);
	}
	
		
	public Map<String,  Object> selectByJunggoPostNo(int postNo) {
		return postDao.selectByJunggoPostNo(postNo);
	}

	@Override
	public int updateByJunggoPostNo(int postNo) {
		return postDao.updateByJunggoPostNo(postNo);
	}

	@Override
	public int insertJunggo(PostVO vo) {
		return postDao.insertJunggo(vo);
	}

	@Override
	public int insertJunggoFile(BoardFileVO vo) {
		return postDao.insertJunggoFile(vo);
	}

	@Override
	public int junggoBdCode() {
		return postDao.junggoBdCode();
	}

	@Override
	public List<Map<String, Object>> postBybdCode(int bdCode) {
		return postDao.postBybdCode(bdCode);
	}


	public List<Map<String, Object>> selectByNoticeStudent(String stuNo) {
		return postDao.selectByNoticeStudent(stuNo);
	}

}
