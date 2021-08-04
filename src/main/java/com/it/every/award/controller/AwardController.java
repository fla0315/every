package com.it.every.award.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.admin.student.model.StudentManageService;
import com.it.every.admin.student.model.StudentManageVO;
import com.it.every.award.model.AwardService;
import com.it.every.award.model.AwardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/student")
@RequiredArgsConstructor
public class AwardController {

	private static final Logger logger = LoggerFactory.getLogger(AwardController.class);
	private final AwardService awardService;
	private final StudentManageService studentManageService;
	
	@RequestMapping("/scholarshipApproved")
	public String scholarshipApprovedList(Model model) {
		
		logger.info("장학금 대상자 페이지 조회");
		
		List<AwardVO> list = awardService.selectAwardApproved();
		logger.info("장학금 대상자 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/student/scholarshipApproved";
	}
	
	@RequestMapping("/scholarshipApplyList")
	public String scholarshipApplyList(Model model) {
		
		logger.info("장학금 신청자 페이지 조회");
		
		List<AwardVO> list = awardService.selectApplyList();
		logger.info("장학금 신청자 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/student/scholarshipApplyList";
	}
	
	@GetMapping("/scholarshipApply")
	public String scholarshipApply(Model model) {
		logger.info("장학금 신청 화면 호출");
		
		List<AwardVO> scholarshipList = awardService.scholarshipList();
		List<StudentManageVO> studentList = studentManageService.selectBeingInSchool();
		
		logger.info("장학금종류 조회 결과, scholarshipList.size={}", scholarshipList.size());
		logger.info("학생명단 조회 결과, studentList.size={}", studentList.size());
		
		model.addAttribute("scholarshipList", scholarshipList);
		model.addAttribute("studentList", studentList);
		
		return "admin/student/scholarshipApply";
	}
	
	
	@PostMapping("/apply_post")
	public String apply_post(@ModelAttribute AwardVO vo, Model model) {
		
		logger.info("장학금신청 처리, 파라미터 vo={}", vo);
		
		int cnt = awardService.applyAward(vo);
		logger.info("장학금 신청 결과, cnt={}", cnt);
		
		String msg = "장학금등록 실패!", url = "/admin/student/scholarshipApply";
		if(cnt > 0) {
			msg="장학금신청이 완료되었습니다";
			url="/admin/student/scholarshipApplyList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/changeApproved")
	public String changeApproved(@RequestParam String awardNo, Model model) {
		
		logger.info("장학금신청 승인, 파라미터 awardNo={}", awardNo);
		
		int cnt = awardService.scholarshipApproved(awardNo);
		logger.info("승인 결과, cnt={}", cnt);
		
		String msg = "승인 실패!", url = "/admin/student/scholarshipApplyList";
		if(cnt > 0) {
			msg = "승인되었습니다.";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/scholarshipStatistic")
	public String scholarshipStatistic(Model model) {
		
		logger.info("장학금 통계 페이지 조회");

		List<Map<String, Object>> awardList = awardService.selectAwardTopFive();
		List<Map<String, Object>> typeList = awardService.selectAwardType();
		
		logger.info("awardList.size={}", awardList.size());
		logger.info("typeList.size={}", typeList.size());
		
		String str1 ="[";
		str1 +="['학과' , '장학금 총액'] ,";
		int num1 =0;
		for (Map<String, Object> map1 : awardList) {
			
			str1 +="['";
			str1 += map1.get("MAJOR");
			str1 +="' , ";
			str1 += map1.get("SCHOLARSHIP");
			str1 +=" ]";
			
			num1 ++;
			if(num1<awardList.size()){
				str1 +=",";
			}		
		}
		str1 += "]";
		
		logger.info("str1 = {}", str1);
		
		String str2 ="[";
		str2 +="['장학금 종류' , '장학금 총액'] ,";
		int num2 =0;
		for (Map<String, Object> map2 : typeList) {
			
			str2 +="['";
			str2 += map2.get("TYPE");
			str2 +="' , ";
			str2 += map2.get("SCHOLARSHIP");
			str2 +=" ]";
			
			num2 ++;
			if(num2<typeList.size()){
				str2 +=",";
			}		
		}
		str2 += "]";
		
		logger.info("str2 = {}", str2);
		
		model.addAttribute("str1", str1);
		model.addAttribute("str2", str2);
		
		return "admin/student/scholarshipStatistic";
	}
}
