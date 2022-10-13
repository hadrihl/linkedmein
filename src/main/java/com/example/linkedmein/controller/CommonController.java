package com.example.linkedmein.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.apache.bcel.classfile.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.linkedmein.entity.User;
import com.example.linkedmein.service.UserService;

import net.bytebuddy.utility.RandomString;

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
	
	// forgot password (GET)
	@GetMapping("/forgot_password")
	public String forgotPassword() {
		return "forgot_password";
	}
	
	// forgot password (POST)
	@PostMapping("/forgot_password")
	public String processForgetPassword(HttpServletRequest request, Model model) {
		
		String email = request.getParameter("email");
		String token = RandomString.make(30);
		
		try {
			userService.updateResetPasswordToken(token, email);
			userService.sendResetPasswordLink(email, token, getSiteURL(request));
			
			model.addAttribute("message", "We have sent a reset password link to your email. Please check.");
			
		} catch (UsernameNotFoundException e) {
			model.addAttribute("error", e.getMessage());
		} catch (UnsupportedEncodingException | MessagingException e) {
			model.addAttribute("error", "Error while sending email.");
		}
		
		return "forgot_password";
	}
	
	@GetMapping("/reset_password")
	public String showResetPasswordPage(@Param(value = "token") String token, Model model) {
		
		User user = userService.getUserByResetPasswordToken(token);
		model.addAttribute("token", token);
		
		if(user == null) {
			model.addAttribute("message", "Invalid token");
			return "message";
		} else {
			model.addAttribute("email", user.getEmail());
		}
		
		return "reset_password";
	}
	
	@PostMapping("/reset_password")
	public String ProcessResetPassword(HttpServletRequest request, Model model) {
	
		String token = request.getParameter("token");
		String password = request.getParameter("password");
		
		User user = userService.getUserByResetPasswordToken(token);
		
		if(user == null) {
			model.addAttribute("message", "Invalid token");
			return "reset_password";
		} else {
			userService.updatePassword(user, password);
			model.addAttribute("message", "You have successfully change your password");
		}
		
		return "reset_success";
	}
}
