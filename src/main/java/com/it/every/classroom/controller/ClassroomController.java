package com.it.every.classroom.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.classroom.model.ClassroomService;
import com.it.every.classroom.model.ClassroomVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/lecture")
@RequiredArgsConstructor
public class ClassroomController {

	private static final Logger logger = LoggerFactory.getLogger(ClassroomController.class);
	private final ClassroomService classroomService;
	
	@RequestMapping("/classroomList")
	public String classroom_list(Model model) {
		
		logger.info("강의실 목록 호출");
		
		List<ClassroomVO> list = classroomService.selectClassroom();
		logger.info("강의실 목록 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/lecture/classroomList";
		
	}
	
	@RequestMapping("/changeUsable")
	public String changeUsable(@RequestParam String classroomCode, 
			@RequestParam String usable, Model model) {
		
		logger.info("사용가능여부 변경, 파라미터 classroomCode={} & usable={}", 
				classroomCode, usable);
		
		if(usable.equals("Y")) {
			usable = "N";
		} else if(usable.equals("N")) {
			usable = "Y";
		}
		
		int cnt = classroomService.changeUsable(classroomCode, usable);
		logger.info("사용가능여부 수정 결과, cnt={}", cnt);
		
		String msg = "사용가능여부 수정 실패!", url = "/admin/lecture/classroomList";
		if(cnt > 0) {
			msg = "변경되었습니다.";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
