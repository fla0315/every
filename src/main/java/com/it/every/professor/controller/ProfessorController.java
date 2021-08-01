package com.it.every.professor.controller;

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

import com.it.every.professor.model.ProfessorService;
import com.it.every.professor.model.ProfessorVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/professor")
@RequiredArgsConstructor
public class ProfessorController {
	private static final Logger logger
	= LoggerFactory.getLogger(ProfessorController.class);
	
	private final ProfessorService professorService;
	
	@RequestMapping("/profMain")
	public void profMain() {
		logger.info("교수님 메인 화면");
	}
	
	@GetMapping("/editProf")
	public String editProf(HttpSession session, Model model) {
		String userid = "profkim";	//(String)session.getAttribute("userId");
		logger.info("교수님 회원정보수정 화면, userid={}", userid);
		
		
		Map<String, Object> map = professorService.selectProfessorDeptView(userid);
		model.addAttribute("map", map);
		
		return "professor/editProf";
	}
	
	@PostMapping("/editProf")
	public String editProf_post(@ModelAttribute ProfessorVO vo, HttpSession session, Model model) {
		String userid = "profkim";	//(String)session.getAttribute("userId");
		logger.info("교수님 회원정보수정 처리 화면, userid={}, vo={}", userid, vo);
		
		String msg="비밀번호 체크 실패", url="/professor/editProf";
		int result = professorService.loginProc(userid, vo.getProfPwd());
		
		if(result==professorService.LOGIN_OK) { //비밀번호가 일치했을 시
			int cnt = professorService.updateProf(vo);
					
			logger.info("회원수정 결과, cnt={}", cnt);
	
			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
			}else {
				msg="회원정보 수정 실패!";
			}
		}else if(result==professorService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/lecture/openLectureList")
	public void openLectureList() {
		logger.info("개설된 담당 강의 목록");
	}
}
