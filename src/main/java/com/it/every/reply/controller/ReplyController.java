package com.it.every.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.post.model.PostVO;
import com.it.every.registration.controller.OpenSubjController;
import com.it.every.reply.model.ReplyService;
import com.it.every.reply.model.ReplyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/reply")
@RequiredArgsConstructor
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(OpenSubjController.class);
	private final ReplyService service;
	
	@ResponseBody
	@RequestMapping("/insert")
	public boolean insertreply(@RequestParam("comment") String contents, @RequestParam("postNo") String postno,@ModelAttribute ReplyVO vo,HttpSession session) {
		boolean result= true;
		
		ReplyVO vo2 = new ReplyVO();
		vo2.setContents(contents);
		int no =Integer.parseInt(postno);
		vo2.setPostNo(no);
		String stuNo = (String) session.getAttribute("no");
		vo2.setWriterCode(stuNo);
		vo2.setDelFlag('N');
	
		int input=service.replycomment(vo2);
		logger.info("결과 re={}",input);
		
		if (input!=1) {
			result=false;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/deletereply")
	public boolean deletereply(@RequestParam("writeno") String no) {
		
		ReplyVO vo = new ReplyVO();
		int replyno= Integer.parseInt(no);
		vo.setReplyNo(replyno);
		vo.setDelFlag('Y');
		
		logger.info("no={}",no);
		
		boolean result= true;
		
		int in = service.inputdelflag(vo);
		
		if (in!=1) {
			result=false;
		}
			
		logger.info("result={}",result);
		
		return true;
	}
	
	@RequestMapping("selectmyreply")
	public String myreply(HttpSession session, Model model, @ModelAttribute ReplyVO vo) {
		
		String no= (String)session.getAttribute("no");
		
		List<ReplyVO> list= service.selectmyreply(no);
		
		logger.info("list={}",list);
		
		model.addAttribute("myreply",list);
		
		return "admin/board/freeBoard/myreplyboard";
	}
	
	
	
	
	//지금은 안쓰는 거(좋아요 할 시간 되면 쓰겠지?)
	@ResponseBody
	@RequestMapping("/good")
	public boolean controlgood(@RequestParam("val") String good, @RequestParam("postNo") String postNo, HttpSession session) {
		boolean result= true;
		
	
		
		int Good = Integer.parseInt(good);
		int postno= Integer.parseInt(postNo);
		String goodpeople= (String)session.getAttribute("no"); //좋아요만 누를 수 있기 때문에 어쩔 수 없다.
		
		logger.info("good={}, postNo={}, goodPeople={}",good,postNo,goodpeople);
		
		PostVO vo = new PostVO();
		
	
		int resultgood= service.goodinput(vo);
		
		if (resultgood!=1) {
			result=false;
		}
		
		return result;
		
	}
	

}
