package com.it.every.admin.professor.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.admin.professor.model.ProfessorManageService;
import com.it.every.admin.professor.model.ProfessorManageVO;
import com.it.every.admin.professor.position.model.ProfessorPositionService;
import com.it.every.admin.professor.position.model.ProfessorPositionVO;
import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;
import com.it.every.lecture.model.LectureService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class ProfessorManageController {

	private static final Logger logger = LoggerFactory.getLogger(ProfessorManageController.class);
	private final ProfessorManageService professorManageService;
	private final ProfessorPositionService professorPositionService;
	private final DepartmentService departmentService;
	private final LectureService lectureService;
	
	@RequestMapping("/professor/professorList")
	public String professorList(Model model) {
		logger.info("교수목록 조회 화면");
		
		List<ProfessorManageVO> list = professorManageService.selectAll();
		logger.info("목록 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/professor/professorList";
	}
	
	
	@RequestMapping("/professor/professorRegister")
	public String professorRegister(Model model) {
		logger.info("교수등록 화면");
		
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<ProfessorPositionVO> positionList = professorPositionService.selectPosition();
		
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("교수직책 조회 결과, positionList.size={}", positionList.size());
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		
		return "admin/professor/professorRegister";
	}
	
	@PostMapping("/professor/register_post")
	public String register_post(@ModelAttribute ProfessorManageVO vo, Model model) {
		
		logger.info("교수등록 처리, 파라미터 vo={}", vo);
		
		int cnt = professorManageService.professorRegister(vo);
		logger.info("교수등록 결과, cnt={}", cnt);
		
		String msg = "교수등록 실패!", url = "/admin/professor/professorRegister";
		if(cnt > 0) {
			msg="교수정보가 등록되었습니다";
			url="/admin/professor/professorList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/professor/professorEdit")
	public String professorEdit(@RequestParam(defaultValue = "0") String profNo, Model model) {
		logger.info("교수정보 수정 화면");
		
		ProfessorManageVO vo = professorManageService.selectByProfNo(profNo);
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<ProfessorPositionVO> positionList = professorPositionService.selectPosition();
		
		logger.info("교수정보 수정 화면, 조회 결과 vo={}", vo);
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("교수직책 조회 결과, positionList.size={}", positionList.size());
		
		model.addAttribute("vo", vo);
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		
		return "admin/professor/professorEdit";
	}
	
	
	@PostMapping("/professor/professorEdit")
	public String professorEdit_post(@ModelAttribute ProfessorManageVO vo, Model model) {
		
		logger.info("교수정보수정 처리, 파라미터 vo={}", vo);
		
		String msg = "비밀번호 체크실패", url = "/admin/professor/professorEdit?profNo=" + vo.getProfNo();
		int cnt = professorManageService.updateProfessor(vo);
		logger.info("수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg = "교수정보 수정되었습니다.";
			url = "/admin/professor/professorList";
		} else {
			msg = "교수정보 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	/*
	@RequestMapping("/professor/professorDelete")
	public String professorDelete(@RequestParam String profNo, Model model) {
		logger.info("교수정보 삭제");
		
		String msg = "삭제 실패", url = "/admin/professor/professorList";
		int cnt = professorManageService.deleteProfessor(profNo);
		if(cnt > 0) {
			msg = "삭제 성공!";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	*/
	
	@RequestMapping("/chart/professorChart")
	public String professorChart(@RequestParam(defaultValue = "0") String profNo, 
			@RequestParam(defaultValue = "0") String lectureNo, Model model) {
		logger.info("교수이름조회, 파라미터 profNo={}, lectureNo={}", 
				profNo, lectureNo);
		
		Map<String, Object> deptMap = professorManageService.selectDeptLecRate();
		Map<String, Object> allMap = professorManageService.selectAllLecRate();
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		
		
		logger.info("조회 결과, deptMap={}", deptMap);
		logger.info("조회 결과, allMap={}", allMap);
		logger.info("조회 결과, deptList={}", deptList);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("profNo", profNo);
		map.put("subjNo", lectureNo);
		
		try {
			Map<String, Object> profMap = professorManageService.searchByProfNo(map);
			List<Map<String, Object>> commentList =  professorManageService.selectLecComment(map);
			logger.info("조회 결과, profMap={}", profMap);
			logger.info("조회 결과, commentList={}", commentList);
			
			String str ="[";
			str +="['범위별 비교', '교수 평균', '학과 평균', '전체 평균'] ,";
			str +="['평균 평점', '" + profMap.get("RATE") + "', '";
			str += deptMap.get("RESULT") + "', '";
			str += allMap.get("RESULT") + "']";
			str += "]";
			
			logger.info("str={}", str);

			model.addAttribute("str1", str);
			model.addAttribute("commentList", commentList);
			
		} catch (Exception e) {
			e.printStackTrace();
			String str ="";
			Map<String, Object> commentList = new HashMap<String, Object>();
			
			model.addAttribute("str1", str);
			model.addAttribute("commentList", commentList);
		}
		
		model.addAttribute("deptList", deptList);
		
		return "admin/chart/professorChart";
	}
	
	@ResponseBody
	@RequestMapping("/chart/profList")
	public List<ProfessorManageVO> deptProfList(@RequestParam String deptNo) {
		logger.info("학과별 교수리스트 - list, 파라미터 deptNo={}", deptNo);
		
		List<ProfessorManageVO> list = professorManageService.selectByDeptNo(deptNo);
		
		logger.info("학과별 교수 조회 결과, list.size={}", list.size());
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/chart/lectureList")
	public List<Map<String, Object>> profLectureList(@RequestParam String profNo) {
		logger.info("교수별 강의리스트 - list, 파라미터 deptNo={}", profNo);
		
		List<Map<String, Object>> lectureList = lectureService.selectByProfNo(profNo);
		
		logger.info("학과별 교수 조회 결과, lectureList.size={}", lectureList.size());
		logger.info("lectureList={}", lectureList);
		
		
		return lectureList;
	}
	
	@GetMapping("/chart/majorProfChart")
	public String majorProfChart(Model model) {
		logger.info("학과별 교수통계 초기화면");
		
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<Map<String, Object>> positionList = professorManageService.selectPosition();
		logger.info("gradeList.size={}", positionList.size());
		
		String str ="[";
		str +="['직책' , '교수 수'] ,";
		int num1 =0;
		for (Map<String, Object> map1 : positionList) {
			
			str +="['";
			str += map1.get("POSITION");
			str +="' , ";
			str += map1.get("COUNT");
			str +=" ]";
			
			num1 ++;
			if(num1<positionList.size()){
				str +=",";
			}		
		}
		str += "]";
		
		logger.info("str1 = {}", str);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("str1", str);
		
		return "admin/chart/majorProfChart";
	}
	
	@RequestMapping("/chart/selectProfMajor")
	public String selectMajorGrade(@RequestParam String major, Model model) {
		
		logger.info("학과별 교수통계 학과조회 화면, parmeter major={}", major);
		
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<Map<String, Object>> majorPositionList = professorManageService.selectMajorPosition(major);
		logger.info("majorPositionList.size={}", majorPositionList.size());
		
		String str ="[";
		str +="['직책' , '교수 수'] ,";
		int num1 =0;
		for (Map<String, Object> map1 : majorPositionList) {
			
			str +="['";
			str += map1.get("POSITION");
			str +="' , ";
			str += map1.get("COUNT");
			str +=" ]";
			
			num1 ++;
			if(num1<majorPositionList.size()){
				str +=",";
			}		
		}
		str += "]";
		
		logger.info("str1 = {}", str);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("str1", str);
		model.addAttribute("major", major);
		
		return "admin/chart/majorProfChart";
	}
}
