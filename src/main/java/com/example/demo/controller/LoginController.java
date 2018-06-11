package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/test5")
	public String user(Model model)
	{
		
		return "UserManagement";
	}
	
	
	@GetMapping("/mode")
	public String showModules(Model model)
	{
		
		return "testAngularJS";
	}
	
	@GetMapping("/mode2")
	public String showModules2(Model model)
	{
		
		return "pagination";
	}
	
	@GetMapping("/pageform")
	public String showAngularForm(Model model)
	{
		
		return "pageform";
	}
	
	@GetMapping("/")
	public String showBRealForm(Model model)
	{
		
		return "bRealForm";
	}
	

}
