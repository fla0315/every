package com.it.every.chitchat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.chitchat.inbox.model.InboxService;
import com.it.every.chitchat.inbox.model.InboxVO;
import com.it.every.chitchat.outbox.model.OutboxService;
import com.it.every.chitchat.outbox.model.OutboxVO;
import com.it.every.employee.model.employeeService;
import com.it.every.professor.model.ProfessorService;
import com.it.every.student.model.StudentService;
import com.it.every.student.model.StudentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chitchat")
@RequiredArgsConstructor
public class ChitchatController {
	private static final Logger logger
		= LoggerFactory.getLogger(ChitchatController.class);
	
	private final ProfessorService professorService;
	private final StudentService studentService;
	private final employeeService employeeService;
	private final OutboxService outboxService;
	private final InboxService inboxService;
	
	
	@RequestMapping("/chitchatMain")
	public void main(Model model, HttpSession session) {
		String no = (String) session.getAttribute("no");
		String name = (String) session.getAttribute("name");
		logger.info("쪽지 메인 화면");
		
		/* 전체 발신/수신 쪽지 조회 */
		List<Map<String, Object>> list = inboxService.chitchatAll(no);
		
		model.addAttribute("list", list);
		logger.info("쪽지 리스트 불러오기 list.size={}", list.size());
	}
	
	@PostMapping("/chitchatMain")
	public String main_post(@ModelAttribute OutboxVO ovo, @RequestParam String receiver, @RequestParam String code, Model model, HttpSession session) {
		logger.info("쪽지 발송하기, 파라미터 ovo={}, receiver={}, code={}", ovo, receiver, code);
		
		int cnt = outboxService.sendMessage(ovo);
		logger.info("ovo={}",ovo);
		
		InboxVO ivo = new InboxVO();
		ivo.setMsgNo(ovo.getMsgNo());
		ivo.setOfficialNo(code);
		
		int cnt2 = inboxService.receiveMessage(ivo);
				
		logger.info("쪽지 발송 결과, cnt={}", cnt);
		logger.info("쪽지 발송 결과, cnt={}", cnt);
		String msg="발송 실패하였습니다.", url="/chitchat/chitchatMain";
		if(cnt>0 && cnt2>0) {
			msg="쪽지를 성공적으로 발송하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";		
	}

	
	@RequestMapping("/searchReceiver")
	public void searchReceiver() {
		logger.info("쪽지 보낼 회원 찾기");
	}
	
	@PostMapping("/searchReceiver")
	public String searchReceiver_post(@RequestParam(required=false) String keyword, Model model) {
		logger.info("받을 사람 검색, 파라미터 keyword={}", keyword);
		
		List<Map<String, Object>> plist = null;
		List<StudentVO> slist = null;
		List<Map<String, Object>> elist = null;
		
		//교수님 조회
		plist = professorService.searchForChat(keyword);
		//학생 조회
		slist = studentService.searchForChat(keyword);
		//직원 조회
		elist = employeeService.searchForChat(keyword);
		
		logger.info("교수님 검색, plist.size={}", plist.size());
		logger.info("학생 검색, slist.size={}", slist.size());
		logger.info("임직원 검색, elist.size={}", elist.size());
		
		model.addAttribute("plist", plist);
		model.addAttribute("slist", slist);
		model.addAttribute("elist", elist);
		
		return "/chitchat/searchReceiver";
	}
}
