package com.it.every.freepage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.evaluation.controller.AttendanceController;
import com.it.every.freepage.model.postService;
import com.it.every.freepage.model.postVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class freeboardController {
	private static final Logger logger
	= LoggerFactory.getLogger(AttendanceController.class);
	public static postService service; 
	
	
	@GetMapping("/write")
	public String freewrite() {
		return "/admin/board/write";
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam("content") String content) {
		postVO vo = new postVO();
		vo.setContents(content);
		int a = service.freewrite(content);
		logger.info("결과 result={}",a);
		return "/admin/board/write";
	}

}
