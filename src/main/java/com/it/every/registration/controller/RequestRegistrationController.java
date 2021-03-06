package com.it.every.registration.controller;

import java.util.HashMap;
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

import com.it.every.attendance.model.AttendanceVO;
import com.it.every.common.RegistrationSearchVO;
import com.it.every.evaluation.model.EvaluationVO;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.registration.model.RegistrationVO;
import com.it.every.registration.model.StudentRegistrationService;
import com.it.every.registrationCart.model.RegistrationCartVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class RequestRegistrationController {
	private static final Logger logger 
	=LoggerFactory.getLogger(RequestRegistrationController.class);

	private final OpenSubjService openSubjService;
	private final StudentRegistrationService studentRegistrationService;
	
	
	@RequestMapping("/request_registration")
	@ResponseBody
	public List<OpenSubjVO> open_registration(@ModelAttribute RegistrationSearchVO regiSearchVo, @ModelAttribute RegistrationVO registrationVo,
			HttpSession session, Model model) {

		logger.info("개설교과과정페이지");
		logger.info("regiSearchVo={}",regiSearchVo);
		System.out.println(regiSearchVo);
		List<OpenSubjVO> list = openSubjService.OpenRegistraionSearch(regiSearchVo);
		System.out.println(list);
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		model.addAttribute("list", list);
		
		return list;

	}
	
	
	@GetMapping("/request_registration")
	public String registration(@ModelAttribute OpenSubjVO openSubjVo ,HttpSession session, Model model) {
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		
		logger.info("학생아이디, 학생 번호 ,user_id={},no={}",userid,stuNo);
		
		logger.info("수강신청내역 페이지");
		logger.info("개설과목들 불러오기");
		
		List<OpenSubjVO> list = openSubjService.OpenRegistraionALL();
		List<Map<String, Object>> facultyMap=openSubjService.selectFacultyS();
		List<Map<String, Object>> typeMap= openSubjService.selectTypeS();
		List<Map<String, Object>> Mylist = studentRegistrationService.selectMyRegistarion(userid); //이게 내 수강신청 내역 보여주는거 
		List<Map<String, Object>> Clist = studentRegistrationService.selectCart(userid);
		
		logger.info("장바구니 전체 ,Clist.size()={}", Clist.size());
		logger.info("개설교과과정페이지 전체 ,Mylist.size()={}", Mylist.size());
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		logger.info("학과 전체 ,facultyMap={}", facultyMap);
		logger.info("이수구분 전체 ,typeMap={}", typeMap);
		
		System.out.println("TypeMap--");
		model.addAttribute("list", list);
		model.addAttribute("facultyMap", facultyMap);
		model.addAttribute("typeMap", typeMap);
		model.addAttribute("Mylist", Mylist);
		model.addAttribute("Clist", Clist);
		
		return "registration/request_registration";
		
	}
	
	
	
	//장바구니에서 수강신청
	@RequestMapping("/request_registrationCartInsert")
	@ResponseBody
	public Map<String, String>  myregistrationCartInsert(HttpSession session,@ModelAttribute RegistrationVO registrationVo ,  @ModelAttribute RegistrationCartVO registrationCartVo ,@ModelAttribute AttendanceVO attendanceVo , @ModelAttribute EvaluationVO evaluationVo,@RequestParam String openSubCode,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationVo.setStuNo(stuNo);
		registrationCartVo.setStuNo(stuNo);
		attendanceVo.setStuNo(stuNo);
		evaluationVo.setStuNo(stuNo);
		
		
		//String userid ="fla0315";
		logger.info("장바구니에서 수강신청페이지 페이지 vo={} ",registrationVo);
		
		System.out.println(openSubCode);
		
		String msg ="수상신청 완료!" , url ="/registration/request_registration";
		String[] codeArr = openSubCode.split(",");
		for (int i = 0; i < codeArr.length; i++) {
			System.out.println(codeArr[i]);
			registrationVo.setOpenSubCode(codeArr[i]);
			attendanceVo.setOpenSubCode(codeArr[i]);
			evaluationVo.setSubCode(codeArr[i]);
			
			int cnt = studentRegistrationService.insertMyRegistarion(registrationVo);
			if(cnt>0) {
				registrationCartVo.setOpenSubCode(codeArr[i]);
				cnt = studentRegistrationService.deleteCart(registrationCartVo);
				 cnt =  studentRegistrationService.insertAutoAttendance(attendanceVo);
				  cnt =  studentRegistrationService.insertAutoEvaluation(evaluationVo);
				  msg="수강신청완료!!!."; 
				  url="/registration/request_registration"; 
			  }else{
				  msg="수강신청실패."; 
				  url="/registration/request_registration"; 
			  }
			model.addAttribute("msg", msg); 
			model.addAttribute("url", url);
		}
		Map<String, String> list = new HashMap<String, String>();
		list.put("msg", msg);
		return list;
	}
	
	
	//개설과목에서 수강신청
	@RequestMapping("/request_registrationInsert")
	@ResponseBody
	public Map<String, String> myregistrationInsert(HttpSession session, @ModelAttribute RegistrationVO registrationVo ,@ModelAttribute AttendanceVO attendanceVo , @ModelAttribute EvaluationVO evaluationVo ,@ModelAttribute RegistrationSearchVO regiSearchVo , @ModelAttribute RegistrationCartVO registrationCartVo ,@RequestParam String openSubCode ,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationVo.setStuNo(stuNo);
		registrationCartVo.setStuNo(stuNo);
		registrationVo.setOpenSubCode(openSubCode);
		attendanceVo.setStuNo(stuNo);
		evaluationVo.setStuNo(stuNo);
		attendanceVo.setOpenSubCode(openSubCode);
		evaluationVo.setSubCode(openSubCode);
		
		
		
		
		
		//int personnel = studentRegistrationService.countPersonnel(registrationVo);
		//int countCount = studentRegistrationService.countCount(registrationVo);
	//	System.out.println(personnel+"총원");
		//System.out.println(countCount+"현재 등록인원");
		
		String msg =" " , url ="/registration/request_registration";
	/*
		if(countCount>=personnel) {
			  msg="정원초과하였습니다."; 
			  url="/registration/request_registration"; 
			  model.addAttribute("msg", msg); 
			  model.addAttribute("url", url);
		}else { */
			int count = studentRegistrationService.checkDuplicate(registrationVo);
			if(count > 0) {
				//실패
				  msg="이미 수강신청을 완료 했습니다."; 
				  url="/registration/request_registration"; 
				  model.addAttribute("msg", msg); 
				  model.addAttribute("url", url);
			}else {
				//여기서 수강신청
				logger.info("수강신청페이지 페이지 vo={} ",registrationVo);
				  int cnt = studentRegistrationService.insertMyRegistarion(registrationVo);
				  registrationCartVo.setOpenSubCode(registrationVo.getOpenSubCode());
				  
				  if(cnt>0){ 
					  cnt = studentRegistrationService.deleteCart(registrationCartVo);
					  cnt =  studentRegistrationService.insertAutoAttendance(attendanceVo);
					  cnt =  studentRegistrationService.insertAutoEvaluation(evaluationVo);
					  msg="수강신청완료!."; 
					  url="/registration/request_registration"; 
					  
				  }else{
					  msg="수강신청실패."; 
					  url="/registration/request_registration"; 
				  }
				  model.addAttribute("msg", msg); 
				  model.addAttribute("url", url);
				
			}
		//}
		
		Map<String, String> list = new HashMap<String, String>();
		list.put("msg", msg);
		return list;
	}
	
	
	/* 수강신청 에이젝스 백업본
	@RequestMapping("/request_registrationInsert")
	public String myregistrationInsert(HttpSession session,@ModelAttribute RegistrationVO registrationVo , @ModelAttribute RegistrationCartVO registrationCartVo ,@RequestParam String openSubCode ,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationVo.setStuNo(stuNo);
		registrationCartVo.setStuNo(stuNo);
		registrationVo.setOpenSubCode(openSubCode);
		
		int personnel = studentRegistrationService.countPersonnel(registrationVo);
		int countCount = studentRegistrationService.countCount(registrationVo);
		System.out.println(personnel+"총원");
		System.out.println(countCount+"현재 등록인원");
		
		String msg =" " , url ="/registration/request_registration";
		
		if(countCount>=personnel) {
			msg="정원초과하였습니다."; 
			url="/registration/request_registration"; 
			model.addAttribute("msg", msg); 
			model.addAttribute("url", url);
		}else {
			int count = studentRegistrationService.checkDuplicate(registrationVo);
			if(count > 0) {
				//실패
				msg="이미 수강신청을 완료 했습니다."; 
				url="/registration/request_registration"; 
				model.addAttribute("msg", msg); 
				model.addAttribute("url", url);
			}else {
				//여기서 수강신청
				logger.info("수강신청페이지 페이지 vo={} ",registrationVo);
				int cnt = studentRegistrationService.insertMyRegistarion(registrationVo);
				registrationCartVo.setOpenSubCode(registrationVo.getOpenSubCode());
				
				if(cnt>0){ 
					cnt = studentRegistrationService.deleteCart(registrationCartVo);
					msg="수강신청완료!."; 
					url="/registration/request_registration"; 
				}else{
					msg="수강신청실패."; 
					url="/registration/request_registration"; 
				}
				model.addAttribute("msg", msg); 
				model.addAttribute("url", url);
				
			}
		}
		return "common/message";
	}
	*/
	
	
	//수강취소
	@RequestMapping("/request_registrationDelete")
	public String myregistrationDelete(HttpSession session,@ModelAttribute RegistrationVO registrationVo ,@RequestParam String openSubCode,@ModelAttribute AttendanceVO attendanceVo , @ModelAttribute EvaluationVO evaluationVo  ,Model model) {
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String)session.getAttribute("no");
		registrationVo.setStuNo(stuNo);
		attendanceVo.setStuNo(stuNo);
		evaluationVo.setStuNo(stuNo);
		attendanceVo.setOpenSubCode(openSubCode);
		evaluationVo.setSubCode(openSubCode);
		
		logger.info("수강신청페이지 페이지 vo={} ",registrationVo);
		int cnt =studentRegistrationService.deleteAutoAttendance(attendanceVo);
			cnt = studentRegistrationService.deleteAutoEvaluation(evaluationVo);
			
			String msg ="수상취소 완료!" , url ="/registration/request_registration";
			if(cnt>0) {
				cnt = studentRegistrationService.deleteMyRegistarion(registrationVo);
				msg="수강취소완료.";
				url="/registration/request_registration";
			}else {
				msg="수강취소실패.";
				url="/registration/request_registration";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		
	}
	
	
	

	
	
	
	//내 수강 과목들 에이젝스로 보여주기
	@RequestMapping("/request_Myregistration")
	@ResponseBody
	public List<Map<String, Object>>  myregistration12(@ModelAttribute RegistrationSearchVO regiSearchVo, HttpSession session, Model model) {
		logger.info("regiSearchVo={}",regiSearchVo);
		
		String userid = (String)session.getAttribute("user_id");
		regiSearchVo.setStudentId(userid);
		
		logger.info("나의수상신청목록 페이지");
		List<Map<String ,Object>> list = studentRegistrationService.searchMyRegistarion(regiSearchVo);
		
		logger.info("나의수상신청목록 , list.size()={}", list.size());
		
		model.addAttribute("list",list);
		
		return list;
	}
	
	
	
	
	
	
}