package com.example.linkedmein.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
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
	public String registerNewUser(Model model, @ModelAttribute("user") User user, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
		
		userService.register(user, getSiteURL(request));
		return "thank-you";
	}
	
	// retrieve site url
	private String getSiteURL(HttpServletRequest request) {
		String siteURL = request.getRequestURL().toString();
		return siteURL.replace(request.getServletPath(), "");
	}
	
	// verify user
	@GetMapping("/verify")
	public String verifyUser(@Param("code") String code) {
		if(userService.verify(code)) {
			return "verify_success";
		} else {
			return "verify_fail";
		}
	}
	
	// get dashboard page
	@GetMapping("/dashboard")
	public String getDashboardPage() {
		return "dashboard";
	}
}
