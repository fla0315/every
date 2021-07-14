package com.it.every.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class registerController {
	private static final Logger logger
	=LoggerFactory.getLogger(registerController.class);

	public final registerService service;

	@GetMapping("/register")
	public String register(){
		logger.info("전체 출력");
		return "/register";
	}

	@RequestMapping("/login")
	public String login() {
		return "/login";
	}

	@RequestMapping("/name")
	public String name() {
		return "inc/name";
	}
	
	@RequestMapping("/register2")
	public String register2() {
		return "/register2";
	}

	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userid) {
		int a =0;
		a= service.checkUserid(userid);
		logger.info("결과 a={}",a);

		return service.checkUserid(userid);
	}

	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int id_Check(@RequestParam("userId") String user_id) {
		logger.info("결과 a={}",service.checkUserid(user_id));
		return service.checkUserid(user_id);
	}
	 
	
}
