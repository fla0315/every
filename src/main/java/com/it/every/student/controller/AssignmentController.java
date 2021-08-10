package com.it.every.student.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.every.assignment.model.AssignmentVO;
import com.it.every.common.ConstUtil;
import com.it.every.common.FileUploadUtil;
import com.it.every.common.RegistrationSearchVO;
import com.it.every.distributeAssign.model.DistributeAssignVO;
import com.it.every.registration.model.StudentRegistrationService;
import com.it.every.student.model.StudentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/student")
@RequiredArgsConstructor
public class AssignmentController {
	
	private static final Logger logger 
		=LoggerFactory.getLogger(AssignmentController.class);

	
	private final FileUploadUtil fileUploadUtil;
	private final StudentService studentService;
	private final StudentRegistrationService regiService;
	
	
	@RequestMapping("/assignment/StudentAssignment")
	public String assignment(@ModelAttribute RegistrationSearchVO regiVo,@ModelAttribute AssignmentVO  assignmentVo,HttpSession session, Model model) {
		logger.info("과제 등록 페이지");
		//여기다가는 과목명과 과제제목을 학번에 맞는걸 뿌려줘야한다
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		regiVo.setStudentId(userid);
		assignmentVo.setStuNo(stuNo);
		
		List<Map<String, Object>> Mylist =regiService.selectMyRegistarion(userid);
		model.addAttribute("Mylist",Mylist);
		logger.info("과목명 , Mylist.size()={}",Mylist.size());
		List<Map<String, Object>> AssignList =studentService.myAssignmemtList(stuNo);
		model.addAttribute("AssignList",AssignList);
		logger.info("과목명 , AssignList.size()={}",AssignList.size());
		
		return "student/assignment/StudentAssignment";
		
	}
	@RequestMapping("/assignment/StudentAssignmentMain")
	public String assignmentMain(@ModelAttribute RegistrationSearchVO regiVo,@ModelAttribute AssignmentVO  assignmentVo,HttpSession session, Model model) {
		logger.info("과제 등록 페이지");
		//여기다가는 과목명과 과제제목을 학번에 맞는걸 뿌려줘야한다
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		regiVo.setStudentId(userid);
		assignmentVo.setStuNo(stuNo);
		
		List<Map<String, Object>> Mylist =regiService.selectMyRegistarion(userid);
		model.addAttribute("Mylist",Mylist);
		logger.info("과목명 , Mylist.size()={}",Mylist.size());
		List<Map<String, Object>> AssignList =studentService.myAssignmemtList(stuNo);
		model.addAttribute("AssignList",AssignList);
		logger.info("과목명 , AssignList.size()={}",AssignList.size());
		
		return "student/assignment/StudentAssignmentMain";
		
	}
	
	
	
	
	
	
	@RequestMapping("/assignment/selectMySubj")
	@ResponseBody
	public List<Map<String, Object>> assignmentName(@ModelAttribute DistributeAssignVO distributeAssignVo ,@RequestParam String openSubCode,HttpSession session, Model model) {
		logger.info("과목번호가 들어왔을 때 과제 목록 불러주는거 ");
		//여기다가는 과목명과 과제제목을 학번에 맞는걸 뿌려줘야한다
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		
		distributeAssignVo.setStudentId(userid);
		distributeAssignVo.setOpenSubCode(openSubCode);
		//1 학생이 수강 중 과목에서 과제들 불러오기 
		
		List<Map<String, Object>> assignList =studentService.selectMyAssignmemt(distributeAssignVo);
		
		logger.info("내가 수강중인 과제에서 과목 전체 ,assignList.size()={}", assignList.size());

		model.addAttribute("assignList", assignList);
		
		return assignList;
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/assignment/assignmentInsert")
	public String assignmentInsert(@ModelAttribute AssignmentVO assignmentVo , @RequestParam String openSubCode,@RequestParam(defaultValue = "0") int mySubj,HttpSession session,HttpServletRequest request, Model model) {
		logger.info("과제 등록 버튼 눌렀을 때, 파라미터 assignmentVo={}",assignmentVo);
		
		String userid = (String)session.getAttribute("user_id");
		String stuNo = (String) session.getAttribute("no");
		System.out.println(stuNo);
		System.out.println(openSubCode);
		
		assignmentVo.setStuNo(stuNo);
		assignmentVo.setOpenSubCode(openSubCode);
		assignmentVo.setAssignNo(mySubj);
		
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list 
				= fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_ASSIGNMENT_FLAG);
			for(int i=0;i<list.size();i++) {
				Map<String, Object> map =list.get(i);
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (Long) map.get("fileSize");				
			}
			
			logger.info("과제 업로드 성공, fileName={}, fileSize={}", 
					fileName, fileSize);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		assignmentVo.setFileName(fileName);
		assignmentVo.setFileSize(fileSize);
		assignmentVo.setOriginalFileName(originalFileName);
		
		String msg="", url="";
		//과제업로드 처리
		int cnt=studentService.insertAssignment(assignmentVo);		
		//
		logger.info("글쓰기 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="과제등록 완료 처리되었습니다.";
			url="/student/assignment/StudentAssignment";
		}else {
			msg="과제등록 실패.";
			url="/student/assignment/StudentAssignment";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}//assignmentInsert
	
	
	
}
