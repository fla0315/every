package com.it.every.post.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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
	public Map<String,  Object> selectByJunggoPostNo(int postNo) {
		return postDao.selectByJunggoPostNo(postNo);
	}

	@Override
	public int updateByJunggoPostNo(int postNo) {
		return postDao.updateByJunggoPostNo(postNo);
	}

}
