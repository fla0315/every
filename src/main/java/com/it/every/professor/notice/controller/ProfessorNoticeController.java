package com.it.every.professor.notice.controller;

import java.sql.Clob;
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

import com.it.every.board.model.BoardService;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.post.model.PostService;
import com.it.every.post.model.PostVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/professor/notice")
@RequiredArgsConstructor
public class ProfessorNoticeController {
	private static final Logger logger
	= LoggerFactory.getLogger(ProfessorNoticeController.class);
	
	private final OpenSubjService openSubjService;
	private final BoardService boardService;
	private final PostService postService;
	
	@GetMapping("/noticeWrite")
	public String noticeWrite(Model model, HttpSession session) {
		String profNo = (String) session.getAttribute("no");
		logger.info("개설교과목 공지사항 등록, profNo={}", profNo);
		
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.boardOpenSubCode(profNo); //교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		return "/professor/notice/noticeWrite";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite_post(@ModelAttribute PostVO vo, @RequestParam (required=false) String openSubCode, Model model) {
		logger.info("개설교과목 공지사항 등록 처리, openSubCode={}, vo={}", openSubCode, vo);
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			int bdCode = boardService.checkBdCode(openSubCode);
			vo.setBdCode(bdCode);
			logger.info("vo세팅 vo={}", vo);
			int cnt = postService.insertNoitce(vo);
			String msg = "공지 등록 실패", url="/professor/notice/noticeWrite";
			if(cnt>0) {
				msg = "공지 등록 성공";
				url="/professor/notice/noticeList?openSubCode="+openSubCode;
			}
			logger.info("공지 등록 여부, cnt={}", cnt);
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}
		return "common/message";
	}
	
	@RequestMapping("/noticeList")
	public void noticeList(@RequestParam (required=false) String openSubCode, Model model, HttpSession session) {
		String profNo = (String) session.getAttribute("no");
		logger.info("개설교과목 공지사항 조회, profNo={}", profNo);
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.boardOpenSubCode(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			int bdCode = boardService.checkBdCode(openSubCode);
			List<PostVO> pList = postService.postByOpenSubCode(bdCode);
			logger.info("bdCode={}, pList.size={}", bdCode, pList.size());
			model.addAttribute("pList", pList);
			model.addAttribute("open", openSubCode);
		}
	}
	
	@RequestMapping("/readCount")
	public String noticeRead(@RequestParam(defaultValue = "0") int postNo, @RequestParam (required=false) String openSubCode, Model model) {
		logger.info("조회수 증가, 파라미터 postNo={}", postNo);
		if(postNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/professor/notice/noticeList");
		}
		
		int cnt = postService.noticeReadCount(postNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		return "redirect:/professor/notice/noticeDetail?postNo="+postNo+"&openSubCode="+openSubCode;
	}
	
	@RequestMapping("/noticeDetail")
	public void noticeDetail(@RequestParam(defaultValue = "0") int postNo, @RequestParam (required=false) String openSubCode, Model model) {
		logger.info("공지사항 세부 조회, 파라미터 postNo={}, openSubCode={}", postNo, openSubCode);
		Map<String, Object> map = postService.postByPostNo(postNo);
		String contents = postService.contentsByPostNo(postNo);
		model.addAttribute("map", map);
		model.addAttribute("contents", contents);
	}
	
	@RequestMapping("/noticeDelete")
	public String delete(@RequestParam(defaultValue = "0") int postNo, @RequestParam (required=false) String openSubCode, Model model) {
		logger.info("공지사항 삭제, 파라미터 postNo={}, openSubCode={}", postNo, openSubCode);
		if(postNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/professor/notice/noticeDetail?postNo="+postNo);
		}
		
		String msg = "공지사항 삭제에 실패하였습니다.", url="/professor/notice/noticeDetail?postNo="+postNo;
		int cnt = postService.deletePostByPostNo(postNo);
		if(cnt>0) {
			msg = "공지사항 삭제 성공!";
			url = "/professor/notice/noticeList?openSubCode="+openSubCode;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/noticeEdit")
	public void noticeEdit(@RequestParam(defaultValue = "0") int postNo, @RequestParam (required=false) String openSubCode, Model model) {
		logger.info("공지사항 수정화면, 파라미터 postNo={}, openSubCode={}", postNo, openSubCode);
		Map<String, Object> map = postService.postByPostNo(postNo);
		String contents = postService.contentsByPostNo(postNo);
		model.addAttribute("map", map);
		model.addAttribute("contents", contents);
	}
	
	@PostMapping("/noticeEdit")
	public String noticeEdit_post(@ModelAttribute PostVO vo , @RequestParam(defaultValue = "0") int postNo, @RequestParam (required=false) String openSubCode, Model model) {
		logger.info("공지사항 수정 처리 화면, 파라미터 postNo={}, openSubCode={}", postNo, openSubCode);
		int cnt = postService.editNotice(vo);
		
		String msg = "공지 수정 실패", url="/professor/notice/noticeEdit?postNo="+postNo;
		if(cnt>0) {
			msg = "공지 수정 성공";
			url="/professor/notice/noticeDetail?postNo="+postNo;
		}
		logger.info("공지 등록 여부, cnt={}", cnt);
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}


