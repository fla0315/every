package com.it.every.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.it.every.sms.sms;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/reg")
public class registerController {
	private static final Logger logger
	=LoggerFactory.getLogger(registerController.class);

	public final registerService service;

	@GetMapping("/register")
	public String register(){
		logger.info("전체 출력");
		return "/reg/register";
	}
	
	@GetMapping("/login")
	public String register2(){
		logger.info("전체 출력");
		return "/reg/login";
	}

	@GetMapping("/checkstuno")
	public String login2(){
		logger.info("전체 출력");
		return "/reg/checkstuno";
	}

	@RequestMapping("/name")
	public String name() {
		return "inc/name";
	}
	
	
	//학번 체크
	@ResponseBody
	@RequestMapping("/stunocheck")
	public boolean ajaxcheckstuno(@RequestParam String stuno) {
		logger.info("ajax이용-학번확인, 파라미터 stuno={}", stuno);
		
		int result=service.checkDuplicatestuno(stuno);
		logger.info("ajax-학번확인 결과, result={}", result);
		
		boolean bool=false;
		if(result!=0) {
			bool=true;
		}
		return bool;
	}
	
	//학번 전달용
	@RequestMapping("/checkstuno")
	public String ajaxstuno(@RequestParam("stuno") String stuno , Model model) {
		logger.info("전달 학번확인, 파라미터 stuno={}", stuno);
		
		int result=service.checkDuplicatestuno(stuno);
		logger.info("ajax-학번확인 결과, result={}, stuno={}", result,stuno);
		
		model.addAttribute("stuno",stuno);
		
		return "/reg/register";
	}
	
	//아이디 체크
	@ResponseBody
	@RequestMapping("/idcheck")
	public boolean ajaxid(@RequestParam String userid) {
		logger.info("ajax이용-아이디 중복확인, 파라미터 userid={}", userid);
		
		int result=service.checkDuplicate(userid);
		logger.info("ajax-아이디 중복확인 결과, result={}", result);
		
		boolean bool=false;
		if(result==registerService.USABLE_ID) {
			bool=true;
		}
		
		return bool;
	}
	
	//비번 체크
	@ResponseBody
	@RequestMapping("/pwd1check")
	public boolean ajaxpwdcheck(@RequestParam("pwd") String pwd) {
		logger.info("ajax이용-비밀번호확인, 파라미터 pwd={}",pwd);
		
		boolean bool=false;
		
		if (pwd.length()>=5&&pwd.length()<=10) {
			bool=true;
		}
		
		logger.info("ajax-비밀번호 확인 결과, result={}", bool);
		
		
		return bool;
	}
	
	//확인용 비번 체크
	@ResponseBody
	@RequestMapping("/pwdcheck")
	public boolean ajaxpwd(@RequestParam("pwd") String pwd, @RequestParam("pwd2") String pwd2) {
		logger.info("ajax이용-비밀번호 동작확인, 파라미터 pwd={}, pwd2={}",pwd,pwd2);
		
		boolean bool=false;
		
		if (pwd.equals(pwd2)) {
			bool=true;
		}
		
		logger.info("ajax-비밀번호 동일확인 결과, result={}", bool);
		
		
		return bool;
	}
	
	//휴대폰인증
	@ResponseBody
	@RequestMapping("/phonecheck")
	public String ajaxphone(@RequestParam("phonenum") String phonenum) {
		logger.info("ajax이용-휴대전화 동작확인, 파라미터 phonenum={}",phonenum);
		
		boolean bool=true;
		
		sms sms = new sms();
		
		String num= sms.smsNaver(phonenum); //인증번호
		
		if (num==""||num.equals(null)) {
			logger.info("ajax이용-번호 없어");	
			bool=false;
		}else {
			logger.info("ajax이용-인증번호 발송");
		}
		
		logger.info("ajax-인증번호 전송 결과, result={}, num={}", bool, num);
		
		return num;
	}
	
	//인증번호 확인
	@ResponseBody
	@RequestMapping("/numcheck")
	public boolean ajaxnum(@RequestParam("num1") String num1, @RequestParam("num2") String num2) {
		logger.info("ajax이용-인증동작확인, 파라미터 num1={} , num2={}", num1,num2);
		
		boolean bool=true;
		
		
		if (num1.equals(num2)) {
			logger.info("인증성공");				
		}else {
			logger.info("번호가 달라");
			bool=false;
		}
		
		logger.info("ajax-인증번호 전송 결과, result={}, num2={}", bool, num2);
		
		return bool;
	}
	
	//아이디 비번 넣기(회원가입)
	@RequestMapping("/write")
	public String register(@ModelAttribute registerVO vo,
			@RequestParam("stuno") String stuno,
			@RequestParam("chkphone") String indentity_code,
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3) {
		logger.info("회원정보 입력 과정 인증, 파라미터  chkphone={}, stuno{}", indentity_code, stuno);
		
		String hp1= vo.getHp1();
		String phonenum = hp1+phone2+phone3;
		vo.setPhonenum(phonenum);
		vo.setStu_no(stuno);
		
		if (indentity_code!=null) {
			logger.info("인증성공");
			vo.setIndenity_state('Y');
		}

		int a = service.registerMember(vo);
		logger.info("회원가입 결과, a={}",a);
	
		return "/every/reg/register2";
	}
	
	//로그인
	@RequestMapping("/check")
	public String register(
			@RequestParam("user_id") String id,  
			@RequestParam("pwd") String pwd,
			@RequestParam("chk_info") String type,
			@RequestParam(required = false) String chkSave,
			HttpServletRequest request, 
			HttpServletResponse response, Model model) {
		logger.info("아이디 비번 체크, 파라미터 id={}, pass={},",id , pwd);
		
		String msg="로그인 처리 실패";
		
		int result=0;
		
		if (type.equals("student")) {
			result = service.logincheck1(id,pwd);
		}else if (type.equals("admin")) {
			result = service.logincheck2(id,pwd);
		}else if (type.equals("professor")) {
			result = service.logincheck3(id,pwd);
		}
	
	logger.info("처리 결과 result={}",result);
	if(result==registerService.LOGIN_OK) {
		HttpSession session = request.getSession();
		session.setAttribute("mbId", id);
		session.setAttribute("mbCode", pwd);
		
	}else if(result==registerService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
	}else if(result==registerService.ID_NONE) {
			msg="해당 아이디가 존재하지 않습니다.";			
	}
		
		return "reg/register";
	}
}

