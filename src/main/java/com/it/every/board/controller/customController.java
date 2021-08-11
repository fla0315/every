package com.it.every.board.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.board.model.BoardService;
import com.it.every.board.model.customVO;
import com.it.every.category.model.categoryVO;

import com.it.every.department.model.DepartmentVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.Controller.registerController;
import com.it.every.register.model.registerVO;
import com.it.every.subjType.model.SubjTypeVO;
import com.it.every.subject.model.SubjectVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/custompage")
@RequiredArgsConstructor
public class customController {
	private static final Logger logger = LoggerFactory.getLogger(registerController.class);
	private final BoardService service;

	@RequestMapping("/custom")
	public String custompage(HttpSession session, Model model, @ModelAttribute customVO vo) {
		
		logger.info("게시판 목록 출력");
		
		String usertype= (String)session.getAttribute("usertype");
		String deptname= (String)session.getAttribute("name");
		 String no = (String)session.getAttribute("no"); 
		 
		 
		
		  
		
		logger.info("섹션확인, type={}, name={}",usertype,deptname);
		
		vo.setUsertype(usertype);
		vo.setProfname(deptname);
		
		List<customVO> list = service.customlist(vo);
		
		logger.info("정보전달, list={}",list);
		
		model.addAttribute("list",list);
		
		return "admin/custompage/custom";

	}
	//상황에 따라서는 바로 ajax쓰자.
	@RequestMapping("custompageDelete")
	public String custompageDelete(@RequestParam("deletename") String name) {
		logger.info("삭제 게시판 이름, name={}",name);
		int result=service.deleteboard(name);
		logger.info("결과, result={}",result);
		return "redirect:/custompage/custom";
	}
	
	@RequestMapping("/custompagechange")
	public String custompagechage() {
		logger.info("수정 페이지 출력");
		return "admin/custompage/custompagechange";
	}

	@RequestMapping("/noticeboard")
	public String customboard() {
		logger.info("커스텀 보드 출력");
		return "admin/custompage/noticeboard";

	}
	
	@ResponseBody
	@RequestMapping("/typecheck")
	public List<customVO> subjname(@RequestParam("type") String type, @RequestParam("name") String name, HttpSession session, Model model){
		
		logger.info("ajax이용한 수업목록 출력확인, 파라미터 type={}",type);
		customVO vo = new customVO();
		
		vo.setType(type);
		vo.setDeptname(name);
		List<customVO> subname= service.subjname(vo);
		
		String usertype= (String)session.getAttribute("usertype");
		
		logger.info("수업목록 확인, 파라미터 name={}",subname);
		if (usertype.equals("professor")) {
			model.addAttribute("subname", subname);
		}else if (usertype.equals("admin")) {
			
		}
		
		
		return subname;

	}
	
	@ResponseBody
	@RequestMapping("/checkadmin")
	public boolean checkadmin(@RequestParam("type") String type, @RequestParam("opensub") String opensub) {
		boolean result=true;
		logger.info("type, type={}",type);
		customVO vo = new customVO();
		
		int typenum= service.category(type); 
		logger.info("num={}",typenum);
		vo.setCategorycode(typenum);
		vo.setOpensubcode(opensub);
		
		int a = service.checkall(vo);
		
		if (a>=1) {
			result=true;
		}else {
			result=false;
		}
		
		return result;
		
	}
	

	
	  @RequestMapping("/custompage2") 
	  public String selectList(@ModelAttribute DepartmentVO depvo, @ModelAttribute categoryVO vo, HttpSession session, Model model) 
	  { 
		  String no = (String)session.getAttribute("no"); 
		  String name= (String)session.getAttribute("name"); 
		  logger.info("게시판 생성, 파라미터 (교수 또는 관리자) 번호={}, 이름={}",no,name);

	   //너로 등록된 거 불러오고
	  List<Map<String, Object>> prolist=service.proselectoption(no);
	  String usertype= (String)session.getAttribute("usertype");
	  String professorwhere = service.professorcalom(no);
	  logger.info("pro={}",professorwhere);
	
	  
	  registerVO regvo= new registerVO();
	  regvo.setChk_info(usertype);
	  
	  List<categoryVO> category = service.selectcategory(regvo);
	  List<DepartmentVO> deptname= service.professordeptname(name);
	  List<DepartmentVO> adminname= service.adminsubjname();
	  //별수 없이 넣는다 진짜  
	  customVO cuvo= new customVO();
	  cuvo.setUsertype(usertype);
	  cuvo.setProfname(name);
	  List<SubjTypeVO> type= service.subjtype(cuvo);
	  
	  model.addAttribute("prolist",prolist);
	  model.addAttribute("type", type);
	  model.addAttribute("category", category);
	  model.addAttribute("professor",professorwhere);

	  
	  if (usertype.equals("professor")) {
		  model.addAttribute("deptname", deptname);
	} else if(usertype.equals("admin")){
		 model.addAttribute("deptname", adminname);
	}
	  
	
	  logger.info("게시판 목록, 결과 category={}", category);
	  logger.info("교수 선택 목록, 결과 prolist={}", prolist);
	  if (deptname!=null) {
		  logger.info("교수학과명, 결과 dept_name={}", deptname);
	  }
	  
	  logger.info("유형불러오기, 결과 type={}",type);
	  
	
	  return "admin/custompage/custompage2"; 
	  }
	  
	  //게시판 등록
	  @RequestMapping("/customwrite")
	  public String boardRegister(@ModelAttribute customVO vo, 
			  HttpSession session, Model model, 
			  @RequestParam("bdname") String bdname,
			  @RequestParam("b2") String subcode,
			  @RequestParam("c") String category
			) 
	  {
		  logger.info("vo={}",vo);
		  vo.setBdname(bdname);
		  vo.setUsage('Y');
		  vo.setOpensubcode(subcode);
		  System.out.println(bdname);
		  System.out.println(subcode);
		  System.out.println(category);
		  
		  
		  int categorycode=Integer.parseInt(service.categorycode(category));
		  vo.setCategorycode(categorycode);
		  boolean bool=true;
		  
		  
		  String usertype= (String)session.getAttribute("usertype");
		  if (usertype.equals("professor")) {
			vo.setAuthcode(4);
		}else if(usertype.equals("admin")) {
			String code= (String)session.getAttribute("no");
			String authcode= service.adminfound(code);
			vo.setAuthcode(Integer.parseInt(authcode));
		}
		  
		  int result=service.insertboard(vo);
		  logger.info("처리중, vo={}, result={}",vo,result);
		  	String msg="실패", url="/custompage/custompage2";
		  if (result!=1) {
			  bool=false;
		}else {
			msg="등록성공";
			url ="/custompage/custompage2";
		}
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
	
		  
		  return "common/message";
		  
	  }
	  
	  
	  //게시판 정보 수정
	  @ResponseBody
	  @RequestMapping("/customchangeinput")
	  public boolean changeboard(@ModelAttribute customVO vo) {
		  int result=service.updateboard(vo);
		  logger.info("결과 result={}",result);
		  Boolean bool= true;
		  if (result!=1) {
			bool=false;
		}
		  return bool;
		  
	  }
}
