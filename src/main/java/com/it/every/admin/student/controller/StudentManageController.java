package com.it.every.admin.student.controller;

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
import com.it.every.admin.student.state.model.StudentStateService;
import com.it.every.admin.student.state.model.StudentStateVO;
import com.it.every.award.model.AwardService;
import com.it.every.award.model.AwardVO;
import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;
import com.it.every.tuition.model.TuitionService;
import com.it.every.tuition.model.TuitionVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class StudentManageController {

	private static final Logger logger = LoggerFactory.getLogger(StudentManageController.class);
	private final StudentManageService studentManageService;
	private final DepartmentService departmentService;
	private final StudentStateService studentStateService;
	private final TuitionService tuitionService;
	
	@GetMapping("/student/studentList")
	public String studentList(Model model) {
		logger.info("학생조회 화면");
		
		List<StudentManageVO> list = studentManageService.selectAll();
		logger.info("목록 결과, list.size={}", list.size());
		
		//3
		model.addAttribute("list", list);
		
		return "admin/student/studentList";
	}
	
	@GetMapping("/student/studentRegister")
	public String studentRegister(Model model) {
		logger.info("학생등록 화면 호출");
		
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<StudentStateVO> stateList = studentStateService.selectAllState();
		
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("학적상태 조회 결과, stateList.size={}", stateList.size());
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("stateList", stateList);
		
		return "admin/student/studentRegister";
	}
	
	@PostMapping("/student/register_post")
	public String register_post(@ModelAttribute StudentManageVO vo, Model model) {
		
		logger.info("학생등록 처리, 파라미터 vo={}", vo);
		
		String stuNo = "";
		String admissionYear = vo.getAdmissionYear();
		vo.setAdmissionYear(admissionYear);
		String deptNo = String.format("%02d", vo.getDeptNo());
		String major = vo.getMajor();
		logger.info("파라미터 admissionYear={}", admissionYear);
		logger.info("파라미터 deptNo={}", deptNo);
		logger.info("파라미터 major={}", major);
		
		List<StudentManageVO> list 
			= studentManageService.selectByYear(vo);
		logger.info("해당년도 등록학생 수 : list.size = {}", list.size());
		
		int num = list.size() + 1;
		String castNum = String.format("%03d", num);
		
		stuNo = admissionYear + deptNo + castNum;
		logger.info("stuNo={}", stuNo);
		
		vo.setStuNo(stuNo);
		
		int cnt = studentManageService.studentRegister(vo);
		logger.info("학생등록 결과, cnt={}", cnt);
		
		String msg = "학생등록 실패!", url = "/admin/student/studentRegister";
		if(cnt > 0) {
			msg="학생이 등록되었습니다";
			url="/admin/student/studentList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/student/studentEdit")
	public String studentEdit(@RequestParam(defaultValue = "0") String stuNo, Model model) {
		
		logger.info("학생정보 수정 화면");
		
		StudentManageVO vo = studentManageService.selectByStuNo(stuNo);
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<StudentStateVO> stateList = studentStateService.selectAllState();
		
		logger.info("학생정보 수정 화면, 조회 결과 vo={}", vo);
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("학적상태 조회 결과, stateList.size={}", stateList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("deptList", deptList);
		model.addAttribute("stateList", stateList);
		
		return "admin/student/studentEdit";
	}
	
	@PostMapping("/student/studentEdit")
	public String studentEdit_post(@ModelAttribute StudentManageVO vo, Model model) {
		
		logger.info("학생정보수정 처리, 파라미터 vo = {}", vo);
		
		String msg = "비밀번호 체크실패", url = "/admin/student/studentEdit?stuNo=" + vo.getStuNo();
		int cnt = studentManageService.updateStudent(vo);
		logger.info("학생정보수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg = "학생정보 수정되었습니다.";
			url = "/admin/student/studentList";
		} else {
			msg = "학생정보 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/student/studentDelete")
	public String studentDelete(@RequestParam String stuNo, Model model) {
		logger.info("학생정보 삭제");
		
		String msg = "삭제 실패", url = "/admin/student/studentList";
		int cnt = studentManageService.deleteStudent(stuNo);
		if(cnt > 0) {
			msg = "삭제 성공!";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/student/leaveManage")
	public String leaveManage() {
		logger.info("휴학관리 화면");
		
		return "admin/student/leaveManage";
	}
	
	@GetMapping("/student/returnManage")
	public String returnManage() {
		logger.info("복학관리 화면");
		
		return "admin/student/returnManage";
	}
	
	@GetMapping("/student/tuitionManage")
	public String tuitionManage(Model model) {
		logger.info("등록금관리 조회 화면");
		
		List<TuitionVO> list = tuitionService.selectTuition();
		
		logger.info("등록금관리 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/student/tuitionManage";
	}
	
	@RequestMapping("/student/tuitionStatistic")
	public String tuitionStatistic(Model model) {
		
		logger.info("등록금 통계 페이지 조회");
		
		List<Map<String, Object>> listMajor = tuitionService.selectTopFive();
		List<Map<String, Object>> listFaculty = tuitionService.selectFaculty();
		
		logger.info("listMajor.size={}", listMajor.size());
		logger.info("listFaculty.size={}", listFaculty.size());
		//logger.info("listFaculty={}", listFaculty.get(0));
		
		String str1 ="[";
		str1 +="['학과' , '등록금 총액'] ,";
		int num1 =0;
		for (Map<String, Object> map1 : listMajor) {
			
			str1 +="['";
			str1 += map1.get("MAJOR");
			str1 +="' , ";
			str1 += map1.get("TUITION");
			str1 +=" ]";
			
			num1 ++;
			if(num1<listMajor.size()){
				str1 +=",";
			}		
		}
		str1 += "]";
		
		logger.info("str1 = {}", str1);
		
		String str2 ="[";
		str2 +="['학부' , '등록금 총액'] ,";
		int num2 =0;
		for (Map<String, Object> map2 : listFaculty) {
			
			str2 +="['";
			str2 += map2.get("FACULTY");
			str2 +="' , ";
			str2 += map2.get("TUITION");
			str2 +=" ]";
			
			num2 ++;
			if(num2<listFaculty.size()){
				str2 +=",";
			}		
		}
		str2 += "]";
		
		logger.info("str2 = {}", str2);
		
		model.addAttribute("str1", str1);
		model.addAttribute("str2", str2);
		
		return "admin/student/tuitionStatistic";
	}
	
	
	@GetMapping("/chart/studentChart")
	public String studentChart() {
		logger.info("학생성적통계 화면");
		
		return "admin/chart/studentChart";
	}
	
	@GetMapping("/chart/majorStuChart")
	public String majorStuChart() {
		logger.info("학과별 학생통계 화면");
		
		return "admin/chart/majorStuChart";
	}
	
}
