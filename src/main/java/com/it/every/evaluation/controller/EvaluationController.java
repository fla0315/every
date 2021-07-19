package com.it.every.evaluation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	
	@GetMapping("/evaluationRecord")
	public String evaluationRecord(@RequestParam String openSubCode, Model model) {
		String profNo = "1"; //@RequestParam String profNo, login시, session으로 받아야함
		
		logger.info("성적 입력/수정 화면");
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		logger.info("개설과목별 조회, 파라미터 openSubCode={}", openSubCode);
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			//개설과목별 학생리스트 불러오기
			List<Map<String, Object>> evList = evaluationService.selectEvaluationView(openSubCode);
			if (evList.size()<0) {
				logger.info("실패");
			}else {
				logger.info("개설과목별 학생리스트 evList.size={}", evList.size());
				model.addAttribute("evList", evList);
				model.addAttribute("open", openSubCode);
			}
		}
		return "/professor/evaluation/evaluationRecord";
	}
	
	@RequestMapping("/evaluationEdit")
	public String evaluationRecord_post(@ModelAttribute EvaluationVO vo, @RequestParam String open, Model model) {
		logger.info("성적 등록/수정 처리, 파라미터 vo={}, openSubCode={}", vo, open);
		vo.setSubCode(open);
		
		int cnt = evaluationService.editBystuNo(vo);
		logger.info("성적 등록/수정 처리 결과, cnt={}", cnt);
		
		String msg="등록/수정 실패!", url="/professor/evaluation/evaluationRecord?openSubCode="+open;
		if(cnt>0) {
			return "redirect:/professor/evaluation/evaluationRecord?openSubCode="+open;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/evaluationCheck")
	public String evaluationCheck(@RequestParam String openSubCode, Model model) {
		String profNo = "1"; //@RequestParam String profNo, login시, session으로 받아야함
		
		logger.info("성적 조회 화면, 파라미터 openSubCode={}", openSubCode);
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			List<Map<String, Object>> evList = evaluationService.selectEvaluationView(openSubCode);
			if (evList.size()<0) {
				logger.info("실패");
			}else {
				logger.info("개설과목별 학생리스트 evList.size={}", evList.size());
				model.addAttribute("evList", evList);
			}
		}
		return "/professor/evaluation/evaluationCheck";
	}
}
