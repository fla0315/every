package com.it.every.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("pdf/*")//공통적인 url mapping
public class TuitionPDF {
	

	 
	 
	    @Inject
	    PdfServiceImpl pdfService;
	    
	    @RequestMapping("list.do")
	    public ModelAndView list() throws Exception{
	        //pdf 파일 생성
	        String result = pdfService.createPdf();
	        
	        return new ModelAndView("pdf/result", "message", result);
	    }
	    
	
}
