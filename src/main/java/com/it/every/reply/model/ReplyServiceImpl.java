package com.it.every.reply.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.every.post.model.PostVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	private final ReplyDAO dao;

	@Override
	public int replycomment(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.replycomment(vo);
	}

	@Override
	public List<Map<String, Object>> selectreply(int no) {
		// TODO Auto-generated method stub
		return dao.selectreply(no);
	}

	@Override
	public int inputdelflag(ReplyVO vo) {
		// TODO Auto-generated method stub
		return dao.inputdelflag(vo);
	}

	@Override
	public int goodinput(PostVO vo) {
		// TODO Auto-generated method stub
		return dao.goodinput(vo);
	}

	@Override
	public String contentsByPostNo(int postNo) {
		// TODO Auto-generated method stub
		return dao.contentsByPostNo(postNo);
	}

	@Override
	public List<ReplyVO> selectmyreply(String code) {
		// TODO Auto-generated method stub
		return dao.selectmyreply(code);
	}

	

}
