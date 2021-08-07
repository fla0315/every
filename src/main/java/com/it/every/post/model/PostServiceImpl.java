package com.it.every.post.model;

import java.util.List;

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

}
