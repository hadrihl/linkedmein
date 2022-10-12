package com.example.linkedmein.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	
	// get homepage
	@GetMapping("/")
	public String getHomePage() {
		return "index";
	}
	
	// get about page
	@GetMapping("/about")
	public String getAboutPage() {
		return "about";
	}
	
	// get contact page
	@GetMapping("/contact")
	public String getContactPage() {
		return "contact";
	}
	
	// get signin page
	@GetMapping("/signin")
	public String getSignInPage() {
		return "signin";
	}
	
	// get signup page
	@GetMapping("/signup")
	public String getSignupPage() {
		return "signup";
	}
}
