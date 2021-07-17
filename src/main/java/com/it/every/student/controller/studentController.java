package com.it.every.student.controller;

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

import com.it.every.student.model.StudentService;
import com.it.every.student.model.StudentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/student")
@RequiredArgsConstructor
public class studentController {

	private static final Logger logger 
		=LoggerFactory.getLogger(studentController.class);
	
	private final StudentService studentService;

	
	@GetMapping("/studentEdit")
	public String studentEdit(HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("userId");
		logger.info("학부생 회원정보수정 화면, userid={}", userid);
		Map<String, Object> map = studentService.selectStudentDeptView(userid);
		
		model.addAttribute("map", map);
		return "student/studentEdit";
	}
	
	
	
	@PostMapping("/studentEdit")
	public String studentEdit_post(@ModelAttribute StudentVO vo, HttpSession session, Model model) {
		
		String userid = (String)session.getAttribute("userId");
		logger.info("학부생 회원정보수정 처리 화면, userid={} vo={}", userid, vo);
		
		String msg="비밀번호 체크 실패", url="/student/studentEdit";
		int result = studentService.loginProc(userid, vo.getPwd());
		logger.info("회원수정 처리, 비밀번호 체크 결과, result={}", result);
		
		if(result==studentService.LOGIN_OK) { //비밀번호 일치
			int cnt = studentService.updateStudent(vo);
			logger.info("회원수정 결과, cnt={}", cnt);
	
			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
			}else {
				msg="회원정보 수정 실패!";
			}
		}else if(result==studentService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
