package com.it.every.reply.model;

import java.util.List;
import java.util.Map;

import com.it.every.post.model.PostVO;

public interface ReplyService {
	public int replycomment(ReplyVO vo);
	public List<Map<String, Object>> selectreply(int no);
	public int inputdelflag(ReplyVO vo);
	public int goodinput(PostVO vo);
	public String contentsByPostNo(int postNo);
	
	public List<ReplyVO> selectmyreply(String code);

}
