package com.it.every.evaluation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EvaluationController {
	private static final Logger logger
		= LoggerFactory.getLogger(EvaluationController.class);
	
	@RequestMapping("/professor/evaluation/evaluationRecord")
	public void evaluationRecord() {
		logger.info("성적 등록 화면");
	}
}
