package com.it.every;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class bootController { 
	
	@GetMapping("/inc/top")
	public String student() {
		return "/inc/top";
	}
	
	
	@GetMapping("/inc/admin_top")
	public String admin() {
		return "/inc/admin_top";
	}
	
	@GetMapping("/admin_top")
	public String viewadmin() {
		return "/admin_top";
	}
	
	@GetMapping("/index")
	public String index() {
		return "/index";
	}

}
