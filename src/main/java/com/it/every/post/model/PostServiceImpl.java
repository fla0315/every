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

}
