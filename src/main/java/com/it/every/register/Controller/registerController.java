package com.it.every.register.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.it.every.email.mailSendGoogle;
import com.it.every.employee.model.EmployeeVO;
import com.it.every.professor.model.ProfessorVO;
import com.it.every.register.model.registerDAO;
import com.it.every.register.model.registerService;
import com.it.every.register.model.registerVO;
import com.it.every.sms.sms;
import com.it.every.student.model.StudentVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/reg")
public class registerController {
	private static final Logger logger
	=LoggerFactory.getLogger(registerController.class);

	public final registerService service;


	@GetMapping("/login")
	public String register2(){
		logger.info("로그인 출력");
		return "/reg/login";
	}

	@GetMapping("/checkstuno")
	public String login2(){
		logger.info("회원번호 확인 출력");
		return "/reg/checkstuno";
	}

	@RequestMapping("/name")
	public String name() {
		return "inc/name";
	}

	//회원유형 검색(radio 변경용)
		@ResponseBody
		@RequestMapping("/regtypecheck")
		public String ajaxregtypecheck(@RequestParam("chk_info") String chk_info) {
			logger.info("ajax이용-회원유형 확인, 파라미터 회원유형={}",chk_info);

			boolean bool=true;

			logger.info("ajax-인증번호 전송 결과, result={}, num={}", bool, chk_info);

			return chk_info;
		}
	
	

	//등록된 학생, 교수, 임직원 체크
	@ResponseBody
	@RequestMapping("/stunocheck")
	public boolean ajaxcheckstuno(
			@ModelAttribute registerVO vo) {
		logger.info("ajax이용- 회원가입 시 등록번호 확인, 입력번호={}, 회원유형={} ", vo.getStu_no(), vo.getChk_info());

		int result=service.checkDuplicatestuno(vo);

		logger.info("ajax- 회원가입 시 등록번호 확인 결과, result={}", result);

		boolean bool=false;
		if(result!=0) {
			bool=true;
		}
		return bool;
	}

	//학번 및 유형 전달용(회원가입 시)
	@RequestMapping("/register")
	public String ajaxstuno(@RequestParam("stuno") String stuno, @RequestParam("chk_info") String chk_info, Model model) {
		logger.info("회원가입 시 전달 학번확인, 회원번호 회원번호={}, 회원유형={}", stuno, chk_info);

		String url="/reg/register";
		if( (stuno==null|| stuno.isEmpty()) || (chk_info==null||chk_info.isEmpty())){
			 url="reg/chekstuno";
		}else {
			model.addAttribute("stuno",stuno);
			model.addAttribute("chk_info",chk_info);
		}
		return url;
	}

	//아이디 체크(회원가입 및 로그인에 사용)
	@ResponseBody
	@RequestMapping("/idcheck")
	public boolean ajaxid(@RequestParam String userid,
							@RequestParam String chk_info) {
		logger.info("ajax이용-아이디 중복확인, 파라미터 id={} 유형={}", userid,chk_info);

		registerVO vo = new registerVO();
		
		vo.setUser_id(userid);
		vo.setChk_info(chk_info);
		
		int result=service.checkDuplicate(vo);
		logger.info("ajax-아이디 중복확인 결과, result={}", result);

			//usable_id면 1, 아니면 2.
			//2면 등록된거, 아니면 없는 거.
		boolean bool= true;
		if(result==registerService.USABLE_ID) {
			bool=false;
		}

		return bool;
	}
	
	@ResponseBody
	@RequestMapping("/regphonecheck")
	public boolean ajaxregphonecheck(@RequestParam("phonenum") String phonenum,@RequestParam("chkinfo") String chkinfo) {
		
		
		boolean result=false;
		registerVO vo = new registerVO();
		
		vo.setPhonenum(phonenum);
		vo.setChk_info(chkinfo);
		
		int a=service.checkphonenum(vo);
		
		if (a>=1) {
			result=true;
		}
		
		return result;
		
	}
	

	//회원가입시 비밀번호 체크용
	@ResponseBody
	@RequestMapping("/pwd1check")
	public boolean ajaxpwdcheck(@RequestParam("pwd") String pwd) {
		logger.info("ajax이용-비밀번호확인, 파라미터 pwd={}",pwd);

		int a =1023372823;
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
		logger.info("ajax이용-비밀번호 확인용, 파라미터 비밀번호={}, 비밀번호 확인용={}",pwd,pwd2);

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
	
		logger.info("ajax이용-휴대전화 동작확인, 파라미터 phone-num={}",phonenum);

		boolean bool=true;

		String phone= phonenum;
		sms sms = new sms();
		logger.info("ajax이용-휴대전화 동작확인, 파라미터 phone-num={}",phone);


		String num= sms.smsNaver(phone); //인증번호

		if (num==""||num.equals(null)) {
			logger.info("ajax이용-번호 없어");	
			bool=false;
		}else {
			logger.info("ajax이용-인증번호 발송");
		}

		logger.info("ajax-인증번호 전송 결과, result={}, num={}", bool, num);

		return num;
	}

	//휴대폰인증번호 확인
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
	
	@ResponseBody
	@RequestMapping("/registercheck")
	public boolean checkregister(@RequestParam("stu_no") String num1, @RequestParam("chk_info") String num2) {
		
		boolean result=false;
		
		registerVO vo = new registerVO();
		vo.setStu_no(num1);
		vo.setChk_info(num2);
		
		registerVO vo2  = new registerVO();
		int a=0;
		
		if (num2.equals("student")) {
			 a=service.checkalready1(vo);
		}else if(num2.equals("professor")){
			 a=service.checkalready2(vo);
		}else if (num2.equals("admin")) {
			 a=service.checkalready3(vo);
		}
	
		logger.info("num2={}",num2);

		logger.info("vo={}",vo2);
		if (a>=1) {
			result=true;
		}
		
		logger.info("result={}",result);
		return result;
		
	}

	//이메일인증(교수용)
	@ResponseBody
	@RequestMapping("/emailcheck")
	public String ajaxemail(@RequestParam("emailaddress") String emailaddress) {
		logger.info("ajax이용-이메일 인증 동작확인, 파라미터 email-address={}",emailaddress);

		boolean bool=true;

		mailSendGoogle mail = new mailSendGoogle();

		String num= mail.MailSend(emailaddress); //인증번호

		if (num==""||num.equals(null)) {
			logger.info("ajax이용-문제가 발생");	
			bool=false;
		}else {
			logger.info("ajax이용-인증번호 발송");
		}

		logger.info("ajax-인증번호 전송 결과, result={}, 인증번호={}", bool, num);

		return num;
	}
	
	//로그인 시 성공여부 표기(로그인 실패, 성공)!!!!!!
	@ResponseBody
	@RequestMapping("/loginpwdcheck")
	public boolean ajaxlogincheck(@RequestParam("userid") String userid, @RequestParam("pwd") String pwd, @RequestParam("chk_info") String chk_info) {
		logger.info("ajax이용-비밀번호 확인용, 파라미터 아이디={}, 비밀번호={}, 회원유형={}",userid,pwd,chk_info);

		boolean bool=false;
		int result=0;
		if (chk_info.equals("student")) {
			result=service.logincheck1(userid, pwd);
		}else if (chk_info.equals("professor")) {
			result=service.logincheck2(userid, pwd);
		}else if (chk_info.equals("admin")) {
			result=service.logincheck3(userid, pwd);
		}
		
		if (result==service.LOGIN_OK) {
			bool=true;
		}

		logger.info("ajax-비밀번호 동일확인 결과, result={}", bool);


		return bool;
	}
	
	
	//아이디 비번 넣기(회원가입)
	@RequestMapping("/write")
	public String register(
			@RequestParam("stuno") String stuno,
			@RequestParam("chk_info") String chk_info,
			@RequestParam("phone1") String phone1,
			@RequestParam("phone2") String phone2,
			@RequestParam("phone3") String phone3,
			@RequestParam("email1") String email1,
			@RequestParam("email2") String email2,
			@RequestParam("userid") String userid,
			@RequestParam("pwd") String pwd) {
		
		logger.info("회원정보 입력 과정 인증, 파라미터"
				+ "  회원번호={}, 회원유형={}, 입력 id={}, 입력 pw={}"
					,  stuno, chk_info, userid, pwd);
		String email="제발 좀 끝내자";
		
		String phonenum = phone1+phone2+phone3;
		if (chk_info.equals("professor")) {
			 email = email1+"@"+email2;
		}
		
		
		registerVO vo = new registerVO();
		
		vo.setStu_no(stuno);
		vo.setUser_id(userid);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setPhonenum(phonenum);
		vo.setChk_info(chk_info);
		vo.setIndentitystate('Y');
		
	
		int a = service.registerMember(vo);
		logger.info("회원가입 결과, a={}",a);

		return "professor/profMain";
	}

	//로그인!!!!!!
	@RequestMapping("/checklogin")
	public String register(
			@RequestParam("user_id") String id,  
			@RequestParam("pwd") String pwd,
			@RequestParam("chk_info") String chk_info,
			@RequestParam(required = false) String chkSave,
			HttpServletRequest request, 
			HttpServletResponse response, Model model) {
		logger.info("아이디 비번 체크, 파라미터 id={}, pass={},",id , pwd);

		String msg="로그인 처리 실패";

		int result=0;
		HttpSession session = request.getSession();
		String url="address";
		
		logger.info("사용자 타입={}", chk_info);
		session.setAttribute("usertype", chk_info);
		
		if (chk_info.equals("student")) {
			result = service.logincheck1(id,pwd);
			StudentVO svo = service.selectByuserid(id);
			session.setAttribute("no", svo.getStuNo());
			session.setAttribute("name", svo.getName());
			session.setAttribute("user_id", id);
			logger.info("처리 결과(값을 잘 받아왔는지 확인함) result={} 회원번호={} 회원이름={} 회원아이디={}" 
					,result,svo.getStuNo(),svo.getName(),id);
			url= "redirect:/student/studentMain";
			
		}else if (chk_info.equals("admin")) {
			result = service.logincheck2(id,pwd);
			EmployeeVO evo=service.selectByuserid3(id);
			session.setAttribute("no", evo.getEmpNo());
			session.setAttribute("name", evo.getEmpName());
			session.setAttribute("user_id", id);
			logger.info("처리 결과(값을 잘 받아왔는지 확인함) result={} 회원번호={} 회원이름={} 회원아이디={}"  
					,result,evo.getEmpNo(),evo.getEmpName(),id);
			url= "redirect:/admin/campusInfo/notice";
			
		}else if (chk_info.equals("professor")) {
			result = service.logincheck3(id,pwd);
			ProfessorVO pvo=service.selectByuserid2(id);
			session.setAttribute("no", pvo.getProfNo());
			session.setAttribute("name", pvo.getProfName());
			session.setAttribute("user_id", id);
			logger.info("처리 결과(값을 잘 받아왔는지 확인함) result={} 회원번호={} 회원이름={} 회원아이디={}" 
					,result,pvo.getProfNo(),pvo.getProfName(),id);
			url= "redirect:/professor/profMain";		
		}
		
		return url;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		
		session.removeAttribute("no");
		session.removeAttribute("name");
		session.removeAttribute("user_id");
		session.removeAttribute("usertype");
		
		return "redirect:/";
	}
}

