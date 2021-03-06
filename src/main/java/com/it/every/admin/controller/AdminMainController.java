package com.it.every.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.admin.professor.model.ProfessorManageVO;
import com.it.every.calendar.model.CalendarService;
import com.it.every.calendar.model.CalendarVO;
import com.it.every.campus.model.CampusService;
import com.it.every.campus.model.CampusVO;
import com.it.every.department.model.DepartmentService;
import com.it.every.department.model.DepartmentVO;
import com.it.every.lecture.model.LectureService;
import com.it.every.lecture.model.LectureVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminMainController {

	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	private final CampusService campusService;
	private final CalendarService calendarService;
	private final LectureService lectureService;
	private final DepartmentService departmentService;
	
	
	@RequestMapping("/campusInfo/calendar")
	public String calendar(Model model) {
		logger.info("학사일정 화면");
		
		List<CalendarVO> calendarList = calendarService.selectCalendar();
		List<Map<String, Object>> allList = calendarService.selectAll();
		logger.info("학사일정 조회 결과, calendarList.size={}", calendarList.size());
		logger.info("학사일정 조회 결과, allList.size={}", allList.size());
		
		String str ="";
		int num =0;
		for (CalendarVO vo : calendarList) {
			
			str +="{";
			str += "title: '" + vo.getContents() + "', ";
			str += "start: '" + vo.getSDate().substring(0, 10) + "', ";
			str += "end: '" + vo.getEDate().substring(0, 10) + "'";
			str +="}";
			
			num ++;
			if(num<calendarList.size()){
				str +=", ";
			}		
		}
		
		logger.info("str = {}", str);
		
		model.addAttribute("calendarList", calendarList);
		model.addAttribute("allList", allList);
		model.addAttribute("str", str);
		
		return "admin/campusInfo/calendar";
	}
	
	@RequestMapping("/campusInfo/calendarRegister")
	public String calendarRegister() {
		
		logger.info("학사일정 등록화면 호출");
		
		return "admin/campusInfo/calendarRegister";
	}
	
	@RequestMapping("/campusInfo/register_post")
	public String calendarRegister_post(@ModelAttribute CalendarVO vo, Model model) {
		
		logger.info("학사일정등록 처리, 파라미터 vo={}", vo);
		
		int cnt = calendarService.registerCalendar(vo);
		logger.info("학사일정등록 결과, cnt={}", cnt);
		
		String msg = "학사일정등록 실패!", url = "/admin/campusInfo/calendarRegister";
		if(cnt > 0) {
			msg="학사일정이 등록되었습니다";
			url="/admin/campusInfo/calendar";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/campusInfo/calendarEdit")
	public String calendarEdit(@RequestParam(defaultValue = "0") int calNo, Model model) {
		logger.info("학사일정 수정 화면");
		
		Map<String, Object> map= calendarService.selectByCalNo(calNo);

		logger.info("학사일정 수정 화면, 조회 결과 map={}", map);
		
		model.addAttribute("map", map);
		
		return "admin/campusInfo/calendarEdit";
	}
	
	@PostMapping("/campusInfo/edit_post")
	public String calendarEdit_post(@ModelAttribute CalendarVO vo, Model model) {
		
		logger.info("학사일정수정 처리, 파라미터 vo={}", vo);
		
		String msg = "비밀번호 체크실패", url = "/admin/campusInfo/calendarEdit?calNo=" + vo.getCalNo();
		int cnt = calendarService.editCalendar(vo);
		logger.info("수정 결과, cnt={}", cnt);
		if(cnt > 0) {
			msg = "학사일정이 수정되었습니다.";
			url = "/admin/campusInfo/calendar";
		} else {
			msg = "학사일정 수정 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/campusInfo/calendarDelete")
	public String calendarDelete(@RequestParam(defaultValue = "0") int calNo, Model model) {
		logger.info("학사일정 삭제");
		
		String msg = "삭제 실패", url = "/admin/campusInfo/calendar";
		int cnt = calendarService.deleteCalendar(calNo);
		if(cnt > 0) {
			msg = "삭제 성공!";
		} 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/campusInfo/campusMap")
	public String campusMap(Model model) {
		logger.info("캠퍼스맵 화면");
		
		List<CampusVO> buildingList = campusService.selectBuilding();
		List<CampusVO> deptList = campusService.selectDepartment();
		
		logger.info("조회 결과, buildingList.size={}", buildingList.size());
		logger.info("조회 결과, deptList.size={}", deptList.size());
		
		model.addAttribute("buildingList", buildingList);
		model.addAttribute("deptList", deptList);
		
		return "admin/campusInfo/campusMap";
	}
	
	@RequestMapping("/campusInfo/notice")
	public String notice() {
		logger.info("공지사항 화면");
		
		return "admin/campusInfo/notice";
	}
	
	@RequestMapping("/campusInfo/noticeWrite")
	public String noticeWrite() {
		logger.info("공지사항등록 화면");
		
		return "admin/campusInfo/noticeWrite";
	}
	
	/*
	 * @RequestMapping("/board/freeBoard") public String freeBoard() {
	 * logger.info("자유게시판 화면");
	 * 
	 * return "admin/board/freeBoard"; }
	 */
	
	@RequestMapping("/board/freeBoardReport")
	public String freeBoardReport() {
		logger.info("자유게시판 신고글관리 화면");
		
		return "admin/board/freeBoardReport";
	}
	
	@RequestMapping("/board/marketBoard")
	public String marketBoard() {
		logger.info("거래게시판 화면");
		
		return "admin/board/marketBoard";
	}
	
	@RequestMapping("/board/marketBoardReport")
	public String marketBoardReport() {
		logger.info("거래게시판 신고글관리 화면");
		
		return "admin/board/marketBoardReport";
	}
	
	@RequestMapping("/chart/classChart")
	public String classChart(@RequestParam(defaultValue = "0") String openSubCode, 
			Model model) {
			logger.info("강의별 학생통계 화면, 파라미터 openSubCode={}", openSubCode);
			
			List<DepartmentVO> deptList = departmentService.selectDepartment();
			logger.info("조회 결과, deptList={}", deptList);
			
			try {
			
			Map<String, Object> map = lectureService.selectScoreAvg(openSubCode);
			List<Map<String, Object>> majorList = lectureService.selectMajorCount(openSubCode);
			List<Map<String, Object>> gradeList = lectureService.selectGradeCount(openSubCode);
			
			logger.info("조회 결과, map={}", map);
			logger.info("조회 결과, majorList={}", majorList);
			logger.info("조회 결과, gradeList={}", gradeList);
			
			String str1 ="[";
			str1 +="['수강생 평균 점수','학생 평균'] ,";
			str1 +="['평균 점수', '" + map.get("AVGSCORE") +  "']]";
			
			logger.info("str1={}", str1);
			
			String str2 ="[";
			str2 +="['학년' , '재학생 수'] ,";
			int num1 =0;
			for (Map<String, Object> map1 : gradeList) {
				
				str2 +="['";
				str2 += map1.get("GRADE");
				str2 +="' , ";
				str2 += map1.get("COUNT");
				str2 +=" ]";
				
				num1 ++;
				if(num1<gradeList.size()){
					str2 +=",";
				}		
			}
			str2 += "]";
			
			logger.info("str2={}", str2);
			
			model.addAttribute("str1", str1);
			model.addAttribute("str2", str2);
			model.addAttribute("majorList", majorList);
			model.addAttribute("gradeList", gradeList);
			model.addAttribute("deptList", deptList);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			String str1 = "";
			String str2 = "";
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<Map<String, Object>> majorList = null;
			List<Map<String, Object>> gradeList = null;
			
			model.addAttribute("str1", str1);
			model.addAttribute("str2", str2);
			model.addAttribute("majorList", majorList);
			model.addAttribute("deptList", deptList);
		}
		
		
		return "admin/chart/classChart";
	}
	
	@ResponseBody
	@RequestMapping("/chart/deptLecture")
	public List<Map<String, Object>> deptLectureList(@RequestParam String deptNo) {
		logger.info("학과별 강의리스트 - list, 파라미터 deptNo={}", deptNo);
		
		List<Map<String, Object>> list = lectureService.selectByDeptNo(deptNo);
		
		logger.info("학과별 교수 조회 결과, list.size={}", list.size());
		logger.info("학과별 교수 조회 결과, list={}", list);
		
		return list;
	}
}
