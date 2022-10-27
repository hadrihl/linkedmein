package com.example.linkedmein.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.linkedmein.entity.User;
import com.example.linkedmein.service.UserService;

@Controller
public class CommonController {
	
	@Autowired
	private UserService userService;
	
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
	
	// register new user
	@PostMapping("/process_signup")
	public String registerNewUser(Model model, @ModelAttribute("user") User user) {
		userService.saveUser(user);
		return "thank-you";
	}
}
