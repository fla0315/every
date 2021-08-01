package com.it.every.registration.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.common.RegistrationSearchVO;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.registration.model.StudentRegistrationService;
import com.it.every.registrationCart.model.RegistrationCartVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class OpenSubjController {

	private static final Logger logger = LoggerFactory.getLogger(OpenSubjController.class);

	private final OpenSubjService openSubjService;
	private final StudentRegistrationService studentRegistrationService;

	@RequestMapping("/open_registration")
	@ResponseBody
	public List<OpenSubjVO> open_rregistration(@ModelAttribute RegistrationSearchVO regiSearchVo,
			HttpSession session, Model model) {

		logger.info("개설교과과정페이지");
		logger.info("regiSearchVo={}",regiSearchVo);

		List<OpenSubjVO> list = openSubjService.OpenRegistraionSearch(regiSearchVo);

		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());

		model.addAttribute("list", list);
		
		
		return list;

	}

	
	  @GetMapping("/open_registration") public String
	  open_rregistration(@ModelAttribute OpenSubjVO openSubjVo , HttpSession
	  session, Model model) {
	  
	  logger.info("개설교과과정페이지");
	  
	  List<OpenSubjVO> list = openSubjService.OpenRegistraionALL();
	  List<Map<String, Object>> facultyMap=openSubjService.selectFacultyS(); //학부이름
	  List<Map<String, Object>> typeMap= openSubjService.selectTypeS(); //이수구분
	  
	  logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
	  logger.info("학과 전체 ,facultyMap={}", facultyMap); //서브젝트부분에서 찾기
	  logger.info("이수구분 전체 ,typeMap={}", typeMap);
	  
	  System.out.println(list);
	  System.out.println("TypeMap--");
	  System.out.println(typeMap);
	  
	  model.addAttribute("list", list); 
	  model.addAttribute("facultyMap", facultyMap); 
	  model.addAttribute("typeMap", typeMap);
	  
	  return "registration/open_registration";
	  
	  }
	  
	 

//	@GetMapping("/open_registrationBysearch")
//	public String open_registrationBysearch(@ModelAttribute SearchVO searchVo , HttpSession session,  Model model) {
//		
//		logger.info("년도로 검색하는 페이지");
//		
//		List<Map<String, Object>> facultyMap=openSubjService.selectFacultyS();
//		List<Map<String, Object>> typeMap= openSubjService.selectTypeS();
//		
//		List<OpenSubjVO> searchList = openSubjService.OpenRegistraionSearch(searchVo);
//		
//		logger.info("학과 전체 ,facultyMap={}", facultyMap);
//		logger.info("이수구분 전체 ,typeMap={}", typeMap);
//		
//		logger.info("검색하는조건으로 ,searchList={}", searchList);
//		model.addAttribute("searchList", searchList);
//		
//		model.addAttribute("facultyMap", facultyMap);
//		model.addAttribute("typeMap", typeMap);
//		
//		return "registration/open_registration";
//		
//	}

	@RequestMapping("/open_registrationCart")
	public String insertCart(HttpSession session, @ModelAttribute RegistrationCartVO registrationCartVo, @RequestParam String openSubCode, Model model) {

		String userid = (String) session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		logger.info("장바구니 user_id={},no={},registrationCartVo={},openSubCode={}", userid, stuNo,registrationCartVo,openSubCode);

		registrationCartVo.setOpenSubCode(openSubCode);
		registrationCartVo.setStuNo(stuNo);
		System.out.println(openSubCode);
		System.out.println(stuNo);
		
		int result =0;
		System.out.println(result+"초기값 0");
		result = studentRegistrationService.checkDuplicateCart(registrationCartVo);
		
		System.out.println(result);
		System.out.println("===========");
		String msg = "장바구니!", url = "/registration/open_registrationCart";
		if(result>0) {
			//실패
			msg = "이미 등록된 과목입니다.";
			url = "/registration/open_registration";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}else{
			
			int cnt = studentRegistrationService.insertCart(registrationCartVo);
			if (cnt > 0) {
				msg = "저장완료";
				url = "/registration/open_registration";
			} else {
				msg = "저장실패.";
				url = "/registration/open_registration";
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
		}
		

		return "common/message";
	}

	
	/*
	 
	 	@RequestMapping("/checkUserid")
		public String checkUserid(@RequestParam String userid, 	@RequestParam String type ,Model model) {
		//1
		logger.info("아이디 중복확인, 파라미터 userid={}, type={}", userid,type);
		
		//2
		int result=0;
		if(userid!=null && !userid.isEmpty()) {
			if(type.equals("user")) {
				result=memberService.checkDuplicate(userid);
			}else if(type.equals("admin")){
				result=managerService.checkDuplicate(userid);
			}
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		//3
		model.addAttribute("result", result);
		model.addAttribute("USABLE_ID", MemberService.USABLE_ID);
		model.addAttribute("UNUSABLE_ID", MemberService.UNUSABLE_ID);
		
		return "member/checkUserid";
	}
	 
	 
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/open_registrationCartDelete")
	public String myregistrationDelete(HttpSession session, @ModelAttribute RegistrationCartVO registrationCartVo,
			Model model) {

		String userid = (String) session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		registrationCartVo.setStuNo(stuNo);
		// String userid ="fla0315";
		logger.info("장바구니 페이지 vo={} ", registrationCartVo);

		int cnt = studentRegistrationService.deleteCart(registrationCartVo);

		String msg = "취소!", url = "/registration/open_registration";
		if (cnt > 0) {
			msg = "취소완료.";
			url = "/registration/registration_cart";
		} else {
			msg = "취소실패.";
			url = "/registration/registration_cart";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	@RequestMapping("/registration_cart")
	public String cart(HttpSession session, @ModelAttribute RegistrationCartVO registrationCartVo, Model model) {

		String userid = (String) session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");

		List<Map<String, Object>> Clist = studentRegistrationService.selectCart(userid);
		logger.info("장바구니 전체 ,Clist.size()={}", Clist.size());
		model.addAttribute("Clist", Clist);
		System.out.println(Clist);
		return "registration/registration_cart";

	}

	@RequestMapping("/Test")
	public String test() {

		return "registration/Test";
	}

}
