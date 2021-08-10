package com.it.every.registration.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.it.every.common.ConstUtil;
import com.it.every.common.FileUploadUtil;
import com.it.every.common.RegistrationSearchVO;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;
import com.it.every.registration.model.StudentRegistrationService;
import com.it.every.registrationCart.model.RegistrationCartVO;
import com.it.every.syllabus.model.SyllabusVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/registration")
@RequiredArgsConstructor
public class OpenSubjController {

	private static final Logger logger = LoggerFactory.getLogger(OpenSubjController.class);

	private final OpenSubjService openSubjService;
	private final StudentRegistrationService studentRegistrationService;
	private final FileUploadUtil fileUploadUtil;
	
	
	@RequestMapping("/open_registration")
	@ResponseBody
	public List<OpenSubjVO> open_rregistration(@ModelAttribute RegistrationSearchVO regiSearchVo,
			HttpSession session, Model model) {

		logger.info("개설교과과정페이지");
		logger.info("regiSearchVo={}",regiSearchVo);
		System.out.println(regiSearchVo);
		List<OpenSubjVO> list = openSubjService.OpenRegistraionSearch(regiSearchVo);
		System.out.println(list);
		logger.info("개설교과과정페이지 전체 ,list.size()={}", list.size());
		model.addAttribute("list", list);
		return list;
	}//에이젝스
	
	
	
	
	  @GetMapping("/open_registration") 
	  public String  open_rregistration(@ModelAttribute OpenSubjVO openSubjVo , HttpSession
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
	  
	  
	 //장바구니
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

	//장바구니삭제
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
	
	//장바구니 보여주기
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

	
	/*===============================================================================*/
	//강의계획서 업로드
	
	/*
	 	@RequestMapping(value="/write.do", method =RequestMethod.POST)
	public String write_post(@ModelAttribute ReBoardVO vo, 
			HttpServletRequest request, Model model) {
		//1
		logger.info("글등록 처리, 파라미터   vo={}", vo);
		
		//2
		//파일 업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list 
				= fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);
			for(int i=0;i<list.size();i++) {
				Map<String, Object> map =list.get(i);
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (Long) map.get("fileSize");				
			}
			
			logger.info("파일 업로드 성공, fileName={}, fileSize={}", 
					fileName, fileSize);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		vo.setOriginalFileName(originalFileName);
		
		String msg="", url="";
		int cnt=reBoardService.insertReBoard(vo);		
		logger.info("글쓰기 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="글쓰기 처리되었습니다.";
			url="/reBoard/list.do";
		}else {
			msg="글쓰기 실패.";
			url="/reBoard/write.do";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	 */
	
	
	/*===============================================================================*/
	//강의 계획서 다운로드
	
	@RequestMapping("/download")
	public ModelAndView download(@ModelAttribute SyllabusVO syllabusVo ,@RequestParam String openSubCode,@RequestParam String syllabus ,HttpServletRequest request) {
		//1
		logger.info("다운로드 처리, 파라미터 syllabusVo={}", syllabusVo);
		
		Map<String, Object> map = new HashMap<>();
		//=====다운로드 맵
		String uploadPath=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_SYLLABUS_FLAG); //이거 실라버스
		File file = new File(uploadPath, syllabusVo.getSyllabus()); //실라버스 파일 이름 가져오는거 
		map.put("file", file);
		map.put("originalFileName", syllabusVo.getSyllabus());
		
		ModelAndView mav = new ModelAndView("syllabusdownloadview", map);
		return mav;
	}
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
