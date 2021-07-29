package com.it.every.subjEval.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.subjEval.model.SubjEvalService;
import com.it.every.subjEval.model.SubjEvalVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/subj_eval")
@RequiredArgsConstructor
public class SubjEvalController {

	
	private static final Logger logger = LoggerFactory.getLogger(SubjEvalController.class);
	
	private final SubjEvalService subjEvalService;
	
	@RequestMapping("/subj_eval")
	public String  subjEvelList(@ModelAttribute SubjEvalVO subjEvalVo,HttpSession session, Model model ) {
		logger.info("강의평가 페이지");
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		
		List<Map<String, Object>> Mylist = subjEvalService.selectMyRegistarion(userid); //
		//List<Map<String, Object>> Mylist = subjEvalService.searchEvalFlag(stuNo);
		
		logger.info("개설교과과정페이지 전체 ,Mylist.size()={}",Mylist.size());
		model.addAttribute("Mylist", Mylist);


		//List<Map<String, Object>> MyGradeList = subjEvalService.searchMyGrade(stuNo);
		//logger.info("개설교과과정페이지 전체 ,MyGradeList.size()={}",MyGradeList.size());
		//model.addAttribute("MyGradeList", MyGradeList);
		logger.info("성적 조회 페이지");
		
		//<Map<String, Object>> Mylist = subjEvalService.selectMyRegistarion(userid); //
		List<Map<String, Object>> MyGradeList = subjEvalService.searchMyGrade(stuNo);
		
		logger.info("개설교과과정페이지 전체 ,MyGradeList.size()={}",MyGradeList.size());
		model.addAttribute("MyGradeList", MyGradeList);
		
		
		return "subj_eval/subj_eval";
		
	}
	
	@RequestMapping("/subj_eval_survey")
	public void  subjEvelSurvey(@ModelAttribute SubjEvalVO subjEvalVo,@RequestParam String openSubCode,HttpSession session, Model model ) {
		logger.info("강의평가 하는 페이지");
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
	}

	
	
	@RequestMapping("/insertSurvey")
	public String insertSurvey(@ModelAttribute SubjEvalVO subjEvalVo ,@RequestParam String openSubCode, HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
				
		
		subjEvalVo.setStuNo(stuNo);
		subjEvalVo.setOpenSubCode(openSubCode);
		subjEvalVo.setClassification("Y");
		
		logger.info("강의평가 등록 ,subjEvalVo={},userid={},stuNo={}",subjEvalVo,userid,stuNo);
		int cnt = subjEvalService.insertSubjEvalStudent(subjEvalVo);
		
		String msg ="강의평가 완료", url="/subj_eval/subj_eval";
		if(cnt>0) {
			msg ="강의평가 완료";
			cnt = subjEvalService.updateEvalFlag(subjEvalVo);
			url="redirect:/subj_eval/subj_eval";
		}else {
			msg ="강의평가 실패";
			url="/subj_eval/subj_eval";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	/*
	 * @RequestMapping("/searchMyGrade")
	 * 
	 * @ResponseBody public List<Map<String, Object>> searchMyGrade(@ModelAttribute
	 * SubjEvalVO subjEvalVo,HttpSession session, Model model ) {
	 * logger.info("성적 조회 페이지");
	 * 
	 * String userid = (String)session.getAttribute("user_id"); String stuNo =
	 * (String)session.getAttribute("no"); //<Map<String, Object>> Mylist =
	 * subjEvalService.selectMyRegistarion(userid); // List<Map<String, Object>>
	 * MyGradeList = subjEvalService.searchMyGrade(stuNo);
	 * 
	 * logger.info("개설교과과정페이지 전체 ,MyGradeList.size()={}",MyGradeList.size());
	 * model.addAttribute("MyGradeList", MyGradeList);
	 * 
	 * return MyGradeList;
	 * 
	 * }
	 */
	
	/*
	 * @RequestMapping("/searchMyGrade") public String searchMyGrade(@ModelAttribute
	 * SubjEvalVO subjEvalVo,HttpSession session, Model model ) {
	 * logger.info("성적 조회 페이지");
	 * 
	 * String userid = (String)session.getAttribute("user_id"); String stuNo =
	 * (String)session.getAttribute("no"); //<Map<String, Object>> Mylist =
	 * subjEvalService.selectMyRegistarion(userid); // List<Map<String, Object>>
	 * MyGradeList = subjEvalService.searchMyGrade(stuNo);
	 * 
	 * logger.info("개설교과과정페이지 전체 ,MyGradeList.size()={}",MyGradeList.size());
	 * model.addAttribute("MyGradeList", MyGradeList);
	 * 
	 * return "subj_eval/subj_eval"; }
	 */
	
	
}
