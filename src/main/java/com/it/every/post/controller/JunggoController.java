package com.it.every.post.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.boardFile.model.BoardFileVO;
import com.it.every.common.ConstUtil;
import com.it.every.common.FileUploadUtil;
import com.it.every.employee.model.employeeService;
import com.it.every.post.model.PostService;
import com.it.every.post.model.PostVO;
import com.it.every.professor.model.ProfessorService;
import com.it.every.student.model.StudentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/junggo")
@RequiredArgsConstructor
public class JunggoController {
	private static final Logger logger = LoggerFactory.getLogger(JunggoController.class);
	private final PostService postService;
	private final FileUploadUtil fileUploadUtil;
	private final ProfessorService professorService;
	private final StudentService studentService;
	private final employeeService employeeService;
	
	
	
	@GetMapping("/junggoMain")
	public void junggoMain(HttpSession session, Model model) {
		String no = (String) session.getAttribute("no");
		char firstNo = no.charAt(0);
		int bdCode = postService.junggoBdCode();
		logger.info("거래게시판, bdCode={}", bdCode);
		List<Map<String, Object>> list = postService.postBybdCode(bdCode);
		//작성자 이름
		for(Map<String, Object> map : list) {
			String writerCode = (String)map.get("WRITER_CODE");
			char startNo = writerCode.charAt(0);
			String writer="";
			if(startNo=='P'){ //교수일 경우
				writer = professorService.nameByProfNo(writerCode);
			} else if(startNo== 'E'){ //임직원의 경우
				writer = employeeService.nameByEmpNo(writerCode);
			} else{	//학생의 경우
				writer = studentService.nameByStuNo(writerCode);
			}
			
			logger.info("작성자 이름={}", writer);
			map.put("WRITER", writer);
		}
		
		model.addAttribute("firstNo", firstNo);
		model.addAttribute("list", list);
	}
	
	@PostMapping("/junggoMain")
	public String junggoMain_post(@ModelAttribute PostVO pVo, @ModelAttribute BoardFileVO bfVo,  HttpServletRequest request, Model model) {
		int bdCode = postService.junggoBdCode();
		logger.info("신규 거래 등록하기, 파라미터 bdCode={}, pVo={}, bfVo={}", bdCode, pVo, bfVo);
		
		pVo.setBdCode(bdCode);
		int cnt = postService.insertJunggo(pVo);
		
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		try {
			List<Map<String, Object>> list 
			= fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_JUNGGO_FLAG);
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
		
		bfVo.setPostNo(pVo.getPostNo());
		bfVo.setFileName(fileName);
		bfVo.setFileSize(fileSize);
		bfVo.setOriginalFileName(originalFileName);

		logger.info("postNo={}, bfVo={}", pVo.getPostNo(), bfVo);
		int cnt2 = postService.insertJunggoFile(bfVo);
		
		logger.info("업로드 처리 결과 cnt={}, cnt2={}", cnt, cnt2);
		
		String msg="업로드 실패하였습니다.", url = "/junggo/junggoMain";
		if(cnt>0 && cnt2>0) {
			msg="업로드 성공하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/junggoDetail")
	public String junggoDetail(HttpSession session,@RequestParam(defaultValue = "0") int postNo, HttpServletRequest request,Model model) {
		String no = (String) session.getAttribute("no");
		char firstNo = no.charAt(0);
		
		logger.info("거래게시판 postNo={}",postNo);
		
		
		if(postNo==0) {
			model.addAttribute("msg", "잘못된 url!");
			model.addAttribute("url", "/junggo/junggoMain");
			
			return "common/message";
		}
		
		
		Map<String,  Object> map =postService.selectByJunggoPostNo(postNo);
		String contents =postService.contentsByPostNo(postNo);
		logger.info("상세보기 결과, map={}", map);
		logger.info("본문, contents={}", contents);
		
		

		//작성자
		String writerCode = String.valueOf(map.get("WRITER_CODE"));
		System.out.println(writerCode);
        char startNo = writerCode.charAt(0);
        String writer="";
        if(startNo=='P'){ //교수일 경우
           writer = professorService.nameByProfNo(writerCode);
        } else if(startNo=='E'){ //임직원의 경우
           writer = employeeService.nameByEmpNo(writerCode);
        } else{   //학생의 경우
           writer = studentService.nameByStuNo(writerCode);
        }
        
        logger.info("작성자 이름={}", writer);
        map.put("WRITER", writer);
        
		model.addAttribute("firstNo", firstNo);
		model.addAttribute("map", map);
		model.addAttribute("contents", contents);
		
		return "junggo/junggoDetail";
	}
	
	
	
	@RequestMapping("/junggoupdate")
	@ResponseBody
	public String callmebayby(HttpSession session,@RequestParam(defaultValue = "0") int postNo ,HttpServletRequest request,Model model) {
		
		logger.info("업데이트 postNo={}",postNo);
		int update = postService.updateByJunggoPostNo(postNo);
		logger.info("업데이트 update={}",update);
		
		return "junggo/junggoDetail";
		
	}
	
	
	
	
}
