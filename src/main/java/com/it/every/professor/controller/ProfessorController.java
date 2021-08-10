package com.it.every.professor.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.it.every.common.ConstUtil;
import com.it.every.common.FileUploadUtil;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.post.model.PostService;
import com.it.every.post.model.PostVO;
import com.it.every.professor.model.ProfessorService;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.syllabus.model.SyllabusService;
import com.it.every.syllabus.model.SyllabusVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/professor")
@RequiredArgsConstructor
public class ProfessorController {
	private static final Logger logger
	= LoggerFactory.getLogger(ProfessorController.class);
	
	private final ProfessorService professorService;
	private final OpenSubjService openSubjService;
	private final SyllabusService syllabusService;
	private final FileUploadUtil fileUploadUtil;
	private final PostService postService;
	
	@RequestMapping("/profMain")
	public void profMain(HttpSession session, Model model) {
		String profNo = (String) session.getAttribute("no");
		logger.info("교수님 메인 화면");
		List<Map<String, Object>> oList = openSubjService.checkClassRoom(profNo);
		List<Map<String, Object>> nList = postService.noticeByProfNo(profNo);
		logger.info("담당교과목 메인화면 리스트 oList.size={}, nList.size={}", oList.size(), nList.size());
		model.addAttribute("oList", oList);
		model.addAttribute("nList", nList);
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
		String userid = (String)session.getAttribute("userId");
		logger.info("교수님 회원정보수정 처리 화면, userid={}, vo={}", userid, vo);
		
		String msg="비밀번호 체크 실패", url="/professor/editProf";
		int result = professorService.loginProc(userid, vo.getProfPwd());
		
		if(result==ProfessorService.LOGIN_OK) { //비밀번호가 일치했을 시
			int cnt = professorService.updateProf(vo);
					
			logger.info("회원수정 결과, cnt={}", cnt);
	
			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
			}else {
				msg="회원정보 수정 실패!";
			}
		}else if(result==ProfessorService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/lecture/openLectureList")
	public void openLectureList(HttpSession session, Model model) {
		String profNo = (String) session.getAttribute("no");
		logger.info("개설된 담당 강의 목록, profNo={}", profNo);
		
		List<Map<String, Object>> oList = openSubjService.listByProfNo(profNo);
		logger.info("list.size={}", oList.size());
		model.addAttribute("oList", oList);
	}
	
	@RequestMapping("/lecture/openLectureCheck")
	public void openLectureCheck(HttpSession session, Model model) {
		String profNo = (String) session.getAttribute("no");
		logger.info("개설된 강의 수락 화면, profNo={}", profNo);
		
		List<Map<String, Object>> oList = openSubjService.listByProfNo(profNo);
		List<Map<String, Object>> sList = syllabusService.checkSyllabusList(profNo);
	
		logger.info("olist.size={}, sList.size={}", oList.size(), sList.size());
		model.addAttribute("oList", oList);
		model.addAttribute("sList", sList);
	}
	
	@GetMapping("/lecture/uploadSyllabus")
	public void uploadSyllabus(HttpServletRequest request, Model model, @RequestParam(defaultValue = "") String openSubCode) {
		logger.info("강의계획서 업로드 화면, openSubCode={}", openSubCode);
	}
	
	@PostMapping("lecture/uploadSyllabus")
	public String uploadSyllabus_post(@ModelAttribute SyllabusVO vo, HttpServletRequest request, Model model) {
		logger.info("강의계획서 업로드 처리, 파라미터 vo={}", vo);
		
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		try {
			List<Map<String, Object>> list 
			= fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_SYLLABUS_FLAG);
			for(int i=0;i<list.size();i++) {
				Map<String, Object> map = list.get(i);
				fileName = (String) map.get("fileName");
				originalFileName = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
			}//for
			
			logger.info("파일 업로드 성공, fileName={}, fileSize={}", 
					fileName, fileSize);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		vo.setSyllabus(fileName);
		logger.info("vo={}", vo);
		int cnt = syllabusService.insertSyllabus(vo);
		logger.info("업로드 처리 결과 cnt={}", cnt);
		
		String msg="업로드 실패하였습니다.", url = "/professor/lecture/uploadSyllabus";
		if(cnt>0) {
			msg="업로드 성공하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("lecture/editSyllabus")
	public void editSyllabus(HttpServletRequest request, Model model, @RequestParam(defaultValue = "") String openSubCode) {
		logger.info("강의계획서 세부 화면, openSubCode={}", openSubCode);
		
		SyllabusVO vo = syllabusService.checkSyllabus(openSubCode);
		logger.info("vo = {}", vo);
		model.addAttribute("vo", vo);
	}
}
