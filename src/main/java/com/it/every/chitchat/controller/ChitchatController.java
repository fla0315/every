package com.it.every.chitchat.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chitchat")
public class ChitchatController {
	private static final Logger logger
		= LoggerFactory.getLogger(ChitchatController.class);
	
	@RequestMapping("/chitchatMain")
	public void main(Model model, HttpSession session) {
		String no = (String) session.getAttribute("no");
		String name = (String) session.getAttribute("name");
		logger.info("쪽지 메인 화면");
	}
	
	@RequestMapping("/searchReceiver")
	public void searchReceiver() {
		logger.info("쪽지 보낼 회원 찾기");
	}
}
