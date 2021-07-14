package com.it.every.evaluation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/professor/evaluation")
public class EvaluationController {
	private static final Logger logger
		= LoggerFactory.getLogger(EvaluationController.class);
	
	@RequestMapping("/evaluationRecord")
	public void evaluationRecord() {
		logger.info("성적 입력/수정 화면");
	}
	
	@RequestMapping("/evaluationCheck")
	public void evaluationCheck() {
		logger.info("성적 조회 화면");
	}
}
