package com.it.every.custompage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.category.model.categoryVO;


import com.it.every.custompage.custommodel.customService;
import com.it.every.department.model.DepartmentVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.Controller.registerController;
import com.it.every.register.model.registerVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/custompage")
@RequiredArgsConstructor
public class customController {
	private static final Logger logger = LoggerFactory.getLogger(registerController.class);
	private final customService service;

	@RequestMapping("/custom")
	public String custompage() {
		logger.info("커스텀 페이지 출력");
		return "admin/custompage/custom";

	}

	@RequestMapping("/noticeboard")
	public String customboard() {
		logger.info("커스텀 보드 출력");
		return "admin/custompage/noticeboard";

	}
	

	
	  @RequestMapping("/custompage2") 
	  public String selectList(@ModelAttribute DepartmentVO depvo, @ModelAttribute categoryVO vo, HttpSession session, Model model) 
	  { 
		  String no = (String)session.getAttribute("no"); 
		  String name= (String)session.getAttribute("name"); 
		  logger.info("게시판 생성, 파라미터 (교수 또는 관리자) 번호={}, 이름={}",no,name);
	  
	  List<Map<String, Object>> prolist=service.proselectoption(no);
	
	  	
	  String usertype= (String)session.getAttribute("usertype");
	  registerVO regvo= new registerVO();
	  regvo.setChk_info(usertype);
	  
	 List<String> category = service.selectcategory(regvo);
	  
	  List<DepartmentVO> deptname= service.professordeptname(name);
	  
	  model.addAttribute("prolist",prolist);
	  
	  model.addAttribute("category", category);
	  
	  model.addAttribute("deptname", deptname);
	  
	  
	  logger.info("게시판 목록, 결과 category={}", category);
	  logger.info("교수 선택 목록, 결과 prolist={}", prolist);
	  if (deptname!=null) {
		  logger.info("교수학과명, 결과 dept_name={}", deptname);
	  }
	  
	
	  return "admin/custompage/custompage2"; 
	  }
	
}
