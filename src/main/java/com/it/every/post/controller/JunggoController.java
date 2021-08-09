package com.it.every.post.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.common.FileUploadUtil;
import com.it.every.post.model.PostService;
import com.it.every.post.model.PostVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/junggo")
@RequiredArgsConstructor
public class JunggoController {
	private static final Logger logger = LoggerFactory.getLogger(JunggoController.class);
	private final PostService postService;
	private final FileUploadUtil fileUploadUtil;
	
	
	
	@RequestMapping("/junggoMain")
	public void main(HttpSession session, Model model) {
		String no = (String) session.getAttribute("no");
		char firstNo = no.charAt(0);
		logger.info("거래게시판");
		
		model.addAttribute("firstNo", firstNo);
	}
	
	@RequestMapping("/junggoDetail")
	public String junggoDetail(HttpSession session,@RequestParam(defaultValue = "0") int postNo ,HttpServletRequest request,Model model) {
		String no = (String) session.getAttribute("no");
		char firstNo = no.charAt(0);
		
		logger.info("거래게시판 postNo={}",postNo);
		
		
		if(postNo==0) {
			model.addAttribute("msg", "잘못된 url!");
			model.addAttribute("url", "/junggo/junggoMain");
			
			return "common/message";
		}
		
		
		Map<String,  Object> map =postService.selectByJunggoPostNo(postNo);
		logger.info("상세보기 결과, vo={}", map);
		
		/*
		String fileInfo
		=Utility.getFileInfo(postVo.getOriginalFileName(), postVo.getFileSize(), 
			request);
		*/
		model.addAttribute("firstNo", firstNo);
		model.addAttribute("map", map);
		
		return "junggo/junggoDetail";
	}
	
	
	
	@RequestMapping("/junggoupdate")
	@ResponseBody
	public String callmebayby(HttpSession session,@RequestParam(defaultValue = "0") int postNo ,HttpServletRequest request,Model model) {
		
		logger.info("업데이트 postNo={}",postNo);
		int update = postService.updateByJunggoPostNo(postNo);
		logger.info("업데이트 update={}",update);
		
		return "junggo/junggoDetail";
		
	}
	
	
	
	
}
