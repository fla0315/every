package com.it.every.professor.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/professor/notice")
public class NoticeController {
	private static final Logger logger
	= LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping("/noticeWrite")
	public void noticeWrite() {
		logger.info("개설교과목 공지사항 등록");
	}
	
	@RequestMapping("/noticeList")
	public void noticeList() {
		logger.info("개설교과목 공지사항 조회");
	}
}


