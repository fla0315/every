package com.it.every.tuition.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.every.tuition.model.TuitionService;
import com.it.every.tuition.model.TuitionVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/tuition")
public class TuitionController {

	private static final Logger logger = LoggerFactory.getLogger(TuitionController.class);

	private final TuitionService tuitionService;

	@RequestMapping("/tuitionList")
	public String scholarshipWrite(@ModelAttribute TuitionVO vo, Model model) {

		logger.info("등록금 조회 , 매개변수 stuNo={}", vo);

		vo.setStuNo("201224026");

		List<TuitionVO> list = tuitionService.selectByStuNo("stuNo");

		logger.info("등록금 조회 결과 list.size={}", list.size());

		model.addAttribute("list", list);
		model.addAttribute("vo", vo);

		return "tuition/tuitionList";

	}
}