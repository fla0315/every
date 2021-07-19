package com.it.every.evaluation.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.every.evaluation.model.EvaluationService;
import com.it.every.evaluation.model.EvaluationVO;
import com.it.every.openSubj.model.OpenSubjService;
import com.it.every.openSubj.model.OpenSubjVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/professor/evaluation")
public class EvaluationController {
	private static final Logger logger
		= LoggerFactory.getLogger(EvaluationController.class);
	
	private final EvaluationService evaluationService;
	private final OpenSubjService openSubjService;
	
	
	@GetMapping("/evaluationRecord")
	public String evaluationRecord(@RequestParam String openSubCode, Model model) {
		String profNo = "1"; //@RequestParam String profNo, login시, session으로 받아야함
		
		logger.info("성적 입력/수정 화면");
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		logger.info("개설과목별 조회, 파라미터 openSubCode={}", openSubCode);
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			//개설과목별 학생리스트 불러오기
			List<Map<String, Object>> evList = evaluationService.selectEvaluationView(openSubCode);
			if (evList.size()<0) {
				logger.info("실패");
			}else {
				logger.info("개설과목별 학생리스트 evList.size={}", evList.size());
				model.addAttribute("evList", evList);
				model.addAttribute("open", openSubCode);
			}
		}
		return "/professor/evaluation/evaluationRecord";
	}
	
	@RequestMapping("/evaluationEdit")
	public String evaluationRecord_post(@ModelAttribute EvaluationVO vo, @RequestParam String open, Model model) {
		logger.info("성적 등록/수정 처리, 파라미터 vo={}, openSubCode={}", vo, open);
		vo.setSubCode(open);
		
		int cnt = evaluationService.editBystuNo(vo);
		logger.info("성적 등록/수정 처리 결과, cnt={}", cnt);
		
		String msg="등록/수정 실패!", url="/professor/evaluation/evaluationRecord?openSubCode="+open;
		if(cnt>0) {
			return "redirect:/professor/evaluation/evaluationRecord?openSubCode="+open;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/evaluationCheck")
	public String evaluationCheck(@RequestParam String openSubCode, Model model) {
		String profNo = "1"; //@RequestParam String profNo, login시, session으로 받아야함
		
		logger.info("성적 조회 화면, 파라미터 openSubCode={}", openSubCode);
		
		//개설과목 select option 채우기
		if(profNo!=null && !profNo.isEmpty()) {
			List<OpenSubjVO> osList = openSubjService.selectByProfNo(profNo);	//교수님이 가진 개설과목 표시
			logger.info("교수님 개설강좌 목록 osList.size={}", osList.size());
			model.addAttribute("osList", osList);
		}
		
		if(openSubCode!=null && !openSubCode.isEmpty()) {
			List<Map<String, Object>> evList = evaluationService.selectEvaluationView(openSubCode);
			if (evList.size()<0) {
				logger.info("실패");
			}else {
				logger.info("개설과목별 학생리스트 evList.size={}", evList.size());
				model.addAttribute("evList", evList);
				model.addAttribute("open", openSubCode);
			}
		}
		return "/professor/evaluation/evaluationCheck";
	}
	
	@RequestMapping(value="/excelDown")
	public void excelDown(@RequestParam String openSubCode, HttpServletResponse response) throws IOException {
		List<Map<String, Object>> evList = evaluationService.selectEvaluationView(openSubCode);
		logger.info("엑셀 다운로드, openSubCode={}, evList={}", openSubCode, evList);
		
		//워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("성적 조회");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		//테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();
		
		//가는 경계선
	   headStyle.setBorderTop(BorderStyle.THIN);
	   headStyle.setBorderBottom(BorderStyle.THIN);
	   headStyle.setBorderLeft(BorderStyle.THIN);
	   headStyle.setBorderRight(BorderStyle.THIN);

	   //배경색
	   headStyle.setFillForegroundColor(HSSFColorPredefined.GREEN.getIndex());
	   headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	   
	   //데이터 가운데 정렬
	   headStyle.setAlignment(HorizontalAlignment.CENTER);
	   
	   // 데이터용 경계 스타일 테두리만 지정
	   CellStyle bodyStyle = wb.createCellStyle();

	   bodyStyle.setBorderTop(BorderStyle.THIN);
	   bodyStyle.setBorderBottom(BorderStyle.THIN);
	   bodyStyle.setBorderLeft(BorderStyle.THIN);
	   bodyStyle.setBorderRight(BorderStyle.THIN);

	   //헤더 생성
	   row = sheet.createRow(rowNo++);
	   cell = row.createCell(0);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("이름");
	   cell = row.createCell(1);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("학번");
	   cell = row.createCell(2);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("학과");
	   cell = row.createCell(3);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("출석");
	   cell = row.createCell(4);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("과제");
	   cell = row.createCell(5);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("중간고사");
	   cell = row.createCell(6);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("기말고사");
	   cell = row.createCell(7);
	   cell.setCellStyle(headStyle);
	   cell.setCellValue("총점");
	   
	   for(Map<String, Object> map : evList) {
		   row = sheet.createRow(rowNo++);
		   cell = row.createCell(0);
		   cell.setCellStyle(bodyStyle);
		   cell.setCellValue((String)map.get("NAME"));
		   cell = row.createCell(1);
		   cell.setCellStyle(bodyStyle);
		   cell.setCellValue((String)map.get("STU_NO"));
		   cell = row.createCell(2);
		   cell.setCellStyle(bodyStyle);
		   cell.setCellValue((String)map.get("MAJOR"));
		   
		   cell = row.createCell(3);
		   cell.setCellStyle(bodyStyle);
		   if(map.get("ATTENDANCE")!=null) {
			   cell.setCellValue(Integer.parseInt(String.valueOf(map.get("ATTENDANCE"))));
		   }else {
			   cell.setCellValue("");
		   }
		   cell = row.createCell(4);
		   cell.setCellStyle(bodyStyle);
		   if(map.get("ASSIGNMENT")!=null) {
			   cell.setCellValue(Integer.parseInt(String.valueOf(map.get("ASSIGNMENT"))));
		   }else {
			   cell.setCellValue("");
		   }
		   cell = row.createCell(5);
		   cell.setCellStyle(bodyStyle);
		   if(map.get("MIDTERM")!=null) {
			   cell.setCellValue(Integer.parseInt(String.valueOf(map.get("MIDTERM"))));
		   }else {
			   cell.setCellValue("");
		   }
		   cell = row.createCell(6);
		   cell.setCellStyle(bodyStyle);
		   if(map.get("FINALS")!=null) {
			   cell.setCellValue(Integer.parseInt(String.valueOf(map.get("FINALS"))));
		   }else {
			   cell.setCellValue("");
		   }
		   cell = row.createCell(7);
		   cell.setCellStyle(bodyStyle);
		   if(map.get("TOTAL_GRADE")!=null){
			   cell.setCellValue(Integer.parseInt(String.valueOf(map.get("TOTAL_GRADE"))));
		   }else {
			   cell.setCellValue("");
		   }
	   }
	   
	   Date d = new Date();
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	   String day = sdf.format(d);
	   
	   // 컨텐츠 타입과 파일명 지정
	   response.setContentType("ms-vnd/excel");
	   response.setHeader("Content-Disposition", "attachment;filename="+openSubCode+day+".xls");

	   // 엑셀 출력
	   wb.write(response.getOutputStream());
	   wb.close();
	}
}
