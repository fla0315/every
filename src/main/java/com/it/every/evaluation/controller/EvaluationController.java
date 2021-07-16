package com.it.every.evaluation.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.evaluation.model.EvaluationService;
import com.it.every.evaluation.model.EvaluationVO;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/professor/evaluation")
public class EvaluationController {
	private static final Logger logger
		= LoggerFactory.getLogger(EvaluationController.class);
	
	private final EvaluationService evaluationService;
	private final OpenSubjService openSubjService;
	
	@RequestMapping("/evaluationRecord")
	public void evaluationRecord(Model model) {
		String profNo = "1"; //@RequestParam String profNo, login시, session으로 받아야함
		
		logger.info("성적 입력/수정 화면");
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
	}
	
	@RequestMapping("/evaluationCheck")
	public void evaluationCheck() {
		logger.info("성적 조회 화면");
	}
	
	@RequestMapping("/checkOpenSubj")//개설과목별 조회
	public String checkOpenSubj(@RequestParam String openSubCode, Model model) {
		logger.info("개설과목별 조회, 파라미터 openSubCode={}", openSubCode);
		
		//개설과목별 학생리스트 불러오기
		List<Map<String, Object>> evList = evaluationService.selectEvaluationView(openSubCode);
		logger.info("교수님 개설강좌 목록 osList.size={}", evList.size());
		model.addAttribute("evList", evList);
		
		return "redirect:/professor/evaluation/evaluationRecord";
	}
}
