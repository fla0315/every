package com.it.every.post.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.post.model.PostService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/junggo")
@RequiredArgsConstructor
public class JunggoController {
	private static final Logger logger = LoggerFactory.getLogger(JunggoController.class);
	private final PostService postService;
	
	@RequestMapping("/junggoMain")
	public void junggoMain(HttpSession session, Model model) {
		String no = (String) session.getAttribute("no");
		char firstNo = no.charAt(0);
		logger.info("거래게시판");
		
		model.addAttribute("firstNo", firstNo);
	}
}
