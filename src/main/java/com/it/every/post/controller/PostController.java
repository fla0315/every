package com.it.every.post.controller;

import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.employee.model.employeeService;
import com.it.every.lecture.controller.LectureController;

import com.it.every.post.model.PostService;
import com.it.every.post.model.PostVO;
import com.it.every.professor.model.ProfessorService;
import com.it.every.reply.model.ReplyService;
import com.it.every.reply.model.ReplyVO;
import com.it.every.student.model.StudentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/post")
@RequiredArgsConstructor
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	private final PostService service;
	private final ReplyService service2;
	private final ProfessorService professorService;
	private final StudentService studentService;
	private final employeeService employeeService;
	
	
	//입력값 저장용
		@ResponseBody
		@RequestMapping("/insert")
		public boolean freeboardinsert(@RequestParam("content") String content, @RequestParam("title") String title, @RequestParam("check") String check, HttpSession session) {
	
			PostVO VO = new PostVO();
			
			VO.setBdCode(1);
			VO.setDelFlag("N");
			VO.setContents(content);
			VO.setTitle(title);
			
			String no = (String)session.getAttribute("no");
			logger.info("no={}",no);
			VO.setWriterCode(no);
	
			
			char checkchar= check.charAt(0);
			VO.setIsPrivate(checkchar);
			int a=0;	
			boolean result=true;
			logger.info("전달값 title={},check={},checkchange={},postno={}",title,check);
		
			
				a= service.freewrite(VO);	
				logger.info("신규등록={}",a);
				result=true;
			/*
				 * else {
				 * 
				 * a=service.updatepost(VO); logger.info("수정결과={}",a); result=true; }
				 */
			
		
			if (a!=1) {
				result=false;
			}
			
			return result;	
		}
		
		//수정용
		@ResponseBody
		@RequestMapping("/change")
		public boolean changeboardinsert(@RequestParam("content") String content, @RequestParam("title") String title, @RequestParam("check") String check,@RequestParam("postno") String postno,  HttpSession session) {
	
			PostVO VO = new PostVO();
			
			VO.setContents(content);
			VO.setTitle(title);
			
			String no = (String)session.getAttribute("no");
			logger.info("no={}",no);
			VO.setWriterCode(no);
	
			
			char checkchar= check.charAt(0);
			VO.setIsPrivate(checkchar);
			int a=0;	
			boolean result=true;
			int changenum=Integer.parseInt(postno);
			
			VO.setPost(changenum);
			logger.info("전달값 title={},check={},postno={}",title,check,postno);
		
			
				a= service.updatepost(VO);	
				logger.info("신규등록={}",a);
				result=true;
			/*
				 * else {
				 * 
				 * a=service.updatepost(VO); logger.info("수정결과={}",a); result=true; }
				 */
			
		
			if (a!=1) {
				result=false;
			}
			
			return result;	
		}
		
		//글쓰기 출력용
		@RequestMapping("/write")
		public String postwrite() {
			logger.info("글쓰기 출력");
			return "/admin/board/freeBoard/write";
		}
		
		//상세보기 전용
		@RequestMapping("/Detail")
		public String postchange(@RequestParam("postNo") String postNo,
				Model model,HttpSession session,@ModelAttribute PostVO vo, @ModelAttribute ReplyVO vo2) {
			logger.info("상세보기");
			int no=Integer.parseInt(postNo);			
			List<Map<String, Object>> list=service.detail(no);
			logger.info("상세보기, detail={}",list);
			
			String msg="삭제된 글입니다.", url="/post/freeboard";
			

			for(Map<String, Object> map : list) {
				String WRITER = (String)map.get("WRITER_CODE");
				char startNo = WRITER.charAt(0);
				String receiverName="";
			
					if(startNo=='P'){ //교수일 경우
						receiverName = professorService.nameByProfNo(WRITER);
					} else if(startNo== 'E'){ //임직원의 경우
						receiverName = employeeService.nameByEmpNo(WRITER);
					} else{	//학생의 경우
						receiverName = studentService.nameByStuNo(WRITER);
					}
					
					logger.info("receiverName={}", receiverName);
					map.put("USERNAME", receiverName);
			
				
			}
			
			model.addAttribute("list",list);
			

			if (list.isEmpty()) {
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				
				return "common/message";
				
			}else {
				msg="어서오세요";
				url="/admin/board/freeBoard/freeBoardDetail";
			
			model.addAttribute("list",list);
			
			List<Map<String, Object>> list2 = service2.selectreply(no);
			
			for(Map<String, Object> map : list2) {
				String WRITER = (String)map.get("WRITER_CODE");
				char startNo = WRITER.charAt(0);
				String receiverName="";
			
					if(startNo=='P'){ //교수일 경우
						receiverName = professorService.nameByProfNo(WRITER);
					} else if(startNo== 'E'){ //임직원의 경우
						receiverName = employeeService.nameByEmpNo(WRITER);
					} else{	//학생의 경우
						receiverName = studentService.nameByStuNo(WRITER);
					}
					
					logger.info("receiverName={}", receiverName);
					map.put("USERNAME", receiverName);
			
				
			}
			
			model.addAttribute("list2",list2);
			logger.info("댓글 보기, list2={}",list2);
			
			int upcount=service.updatecount(no);
			logger.info("관람 수 증가 count={}",upcount);
			
			return url;
			}
			
			
		}
		
		//리스트 출력용
		@RequestMapping("/freeboard") 
		public String boardlist(Model model, @ModelAttribute PostVO vo, HttpSession session) {
			logger.info("리스트 출력");
			
			List<PostVO> list= service.freepost();
			logger.info("정보전달, list={}",list);
			model.addAttribute("list",list); //전체
			
			String no=(String)session.getAttribute("no");
			logger.info("no={}",no);
			
			List<ReplyVO> list2= service2.selectmyreply(no);
			model.addAttribute("list2",list2);	//댓글
			
			logger.info("no2={}",no);
			
			
			List<PostVO> list3=service.mylist(no);
			model.addAttribute("list3",list3);
			logger.info("list3={}",list3); //내 게시글
			
			
			return "/admin/board/freeBoard/freeBoard";
		}
		
		//삭제용
		@RequestMapping("/Delete")
		public String deletelist(@RequestParam("postNo") String postNo) {
			int a =Integer.parseInt(postNo);
			
			int result=service.deletepost(a);
			
			
			return "redirect:/post/freeboard";
			
		}
		
}
