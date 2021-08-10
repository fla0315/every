package com.it.every.reply.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.every.post.model.PostVO;

@Mapper
public interface ReplyDAO {
	public int replycomment(ReplyVO vo); //댓글 입력용
	public List<Map<String, Object>> selectreply(int no); //댓글 불러오기용
	public int inputdelflag(ReplyVO vo); //삭제용
	public int goodinput(PostVO vo); //좋아요. 실패 함 ㅠㅠ
	public String contentsByPostNo(int postNo); //리스트 출력용 이젠 안씀
	
	public List<ReplyVO> selectmyreply(String code); //리스트 출력용
}
