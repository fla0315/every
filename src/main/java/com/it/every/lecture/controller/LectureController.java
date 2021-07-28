package com.it.every.lecture.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.admin.professor.model.ProfessorManageService;
import com.it.every.admin.professor.model.ProfessorManageVO;
import com.it.every.classroom.model.ClassroomService;
import com.it.every.classroom.model.ClassroomVO;
import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;
import com.it.every.lecture.model.LectureService;
import com.it.every.lecture.model.LectureVO;
import com.it.every.subjType.model.SubjTypeService;
import com.it.every.subjType.model.SubjTypeVO;
import com.it.every.subject.model.SubjectService;
import com.it.every.subject.model.SubjectVO;
import com.it.every.timetable.model.TimetableService;
import com.it.every.timetable.model.TimetableVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/lecture")
@RequiredArgsConstructor
public class LectureController {

	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	private final LectureService lectureService;
	private final DepartmentService departmentService;
	private final SubjTypeService subjTypeService;
	private final ProfessorManageService profManageService;
	private final TimetableService timetableService;
	private final ClassroomService classroomService;
	private final SubjectService subjectService;
	
	@RequestMapping("/lectureList")
	public String lectureList(Model model) {
		
		logger.info("개설강의 목록 조회");
		
		List<Map<String, Object>> list = lectureService.selectLecture();
		logger.info("개설강의 목록 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/lecture/lectureList";
	}
	
	@GetMapping("/lectureRegister")
	public String lectureRegister(Model model) {
		logger.info("강의등록 화면");
		
		List<DepartmentVO> deptList = departmentService.selectDepartment();
		List<SubjTypeVO> typeList = subjTypeService.selectSubjType();
		List<ProfessorManageVO> profList = profManageService.selectAll();
		List<TimetableVO> timetableList = timetableService.selectTimetable();
		List<ClassroomVO> classroomList = classroomService.selectUsableY();
		List<SubjectVO> subjectList = subjectService.selectSubject();
		
		logger.info("학과 조회 결과, deptList.size={}", deptList.size());
		logger.info("교과구분 조회 결과, typeList.size={}", typeList.size());
		logger.info("교수 조회 결과, profList.size={}", profList.size());
		logger.info("시간표 조회 결과, timetableList.size={}", timetableList.size());
		logger.info("강의실 조회 결과, classroomList.size={}", classroomList.size());
		logger.info("과목 조회 결과, subjectList.size={}", subjectList.size());
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("typeList", typeList);
		model.addAttribute("profList", profList);
		model.addAttribute("timetableList", timetableList);
		model.addAttribute("classroomList", classroomList);
		model.addAttribute("subjectList", subjectList);
		
		return "admin/lecture/lectureRegister";
	}

	
	@PostMapping("/lectureReg_post")
	//@RequestMapping(value = "/lectureReg_post", method= {RequestMethod.POST})
	public String lectureReg_post(@RequestParam Map<String, String> map, 
			LectureVO vo, Model model) {
		
		logger.info("강의등록 처리");

		String deptNo = map.get("deptNo");
		String subjCode = map.get("subjCode");
		String semester = map.get("semester");
		String openYear = map.get("openYear");
		String timetableCode = map.get("timetableCode");
		String classroomCode = map.get("classroomCode");
		String profNo = map.get("profNo");
		
		logger.info("파라미터 조회 결과, [deptNo={}, subjCode={}, semester={}, "
				+ "openYear={}, timetableCode={}, classroomCode={}, profNo={}]", 
				deptNo, subjCode, semester, openYear, timetableCode, 
				classroomCode, profNo);
		
		vo.setDeptNo(deptNo);
		vo.setSubjCode(subjCode);
		vo.setSemester(semester);
		vo.setOpenYear(openYear);
		vo.setTimetableCode(timetableCode);
		vo.setClassroomCode(classroomCode);
		vo.setProfNo(profNo);
		
		int cnt = lectureService.registerOpenSubj(vo);
		logger.info("강의개설 결과, cnt={}", cnt);
		
		String msg = "강의개설 실패!", url = "/admin/lecture/lectureRegister";
		if(cnt > 0) {
			msg="강의가 개설되었습니다";
			url="/admin/lecture/lectureList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
