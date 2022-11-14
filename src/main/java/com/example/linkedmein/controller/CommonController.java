package com.example.linkedmein.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.apache.bcel.classfile.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.linkedmein.entity.User;
import com.example.linkedmein.service.CustomUserDetails;
import com.example.linkedmein.service.UserService;

import net.bytebuddy.utility.RandomString;

@Controller
public class CommonController {
	
	@Autowired
	private UserService userService;
	
		// get homepage
		@GetMapping("/")
		public String getHomePage(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
			if(loggedinUser != null) {
				model.addAttribute("username", loggedinUser.getUsername());
				model.addAttribute("user_id", userService.getUserByUsername(loggedinUser.getUsername()).getId());
			}
			return "index";
		}
	
	// get about page
	@GetMapping("/about")
	public String getAboutPage(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) 
		throws Exception {
		
		try {
			model.addAttribute("username", loggedinUser.getUsername());
			model.addAttribute("user_id", userService.getUserByUsername(loggedinUser.getUsername()).getId());
			return "about";
		} catch (Exception e) {
			return e.getMessage();
		}
		
		
	}
	
	// get contact page
	@GetMapping("/contact")
	public String getContactPage(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		if(loggedinUser != null) {
			model.addAttribute("username", loggedinUser.getUsername());
			model.addAttribute("user_id", userService.getUserByUsername(loggedinUser.getUsername()).getId());
		}
		return "contact";
	}
	
	// get signin page
	@GetMapping("/signin")
	public String getSignInPage(Model model) {
		return "signin";
	}
	
	@GetMapping("/signin-error")
	public ModelAndView getSigninErrorPage(Model model) {
		ModelAndView mv = new ModelAndView("signin");
		mv.addObject("error_string", "Wrong email/password. Please try again.");
		return mv;
	}
	
	// get signup page
	@GetMapping("/signup")
	public String getSignupPage() {
		return "signup";
	}
	
	// register new user
	@PostMapping("/signup")
	public String registerNewUser(Model model, @ModelAttribute("user") User user, HttpServletRequest request) 
			throws UnsupportedEncodingException, MessagingException {
		
		// check if username/email already exists
		if(userService.getUserByUsername(user.getUsername()) != null) {
			model.addAttribute("error_string", "Username already exists!");
			return "signup";
		} else if(userService.getUserByEmail(user.getEmail()) != null) {
			String error_string = "Email already exists!";
			model.addAttribute("error_string", error_string);
			return "signup";
		}
		
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
	public String getDashboardPage(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		model.addAttribute("username", loggedinUser.getUsername());
		
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);	
		
		long count = userService.countRegisteredUser();
		model.addAttribute("count", count);
		
		return "dashboard";
	}
	
	// get profile page
	@GetMapping("/profile")
	public String getProfilePage(Model model, HttpServletRequest request,
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		model.addAttribute("username", loggedinUser.getUsername());
		
		Integer user_id = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUserById(user_id);
		model.addAttribute("user_id", user.getId());
		model.addAttribute("user", user);
		
		model.addAttribute("email", user.getEmail());
		return "profile";
	}
	
	@PostMapping("/update-username")
	public String updateUsername(Model model, HttpServletRequest request, 
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		
		// get input username & id
		String oldUsername = loggedinUser.getUsername();
		String newUsername = request.getParameter("username");
		Integer userId = Integer.parseInt(request.getParameter("id"));

		// if new username already exists
		if(userService.getUserByUsername(newUsername) != null) {
			model.addAttribute("username", loggedinUser.getUsername());
			User user = userService.getUserById(userId);
			
			if(oldUsername.equals(newUsername)) {
				model.addAttribute("error_string_success", "Hola!! username <b>" + newUsername + "</b> is still awesome!");
			} else {
				model.addAttribute("error_string_warning", "Ops!! username <b>" + newUsername + "</b> already exists! Choose a new one then");
			}
			
			model.addAttribute("user_id", user.getId());
			model.addAttribute("user", user);
			model.addAttribute("email", user.getEmail());
			return "profile";
		}
		
		// if username not exists, change username
		loggedinUser.setUsername(newUsername);
		userService.updateUsername(userId, newUsername);
		
		model.addAttribute("username", loggedinUser.getUsername());
		User user = userService.getUserById(userId);
		model.addAttribute("user_id", user.getId());
		model.addAttribute("user", user);
		model.addAttribute("email", user.getEmail());
		model.addAttribute("error_string_success", "Username <b>" + newUsername + "</b> successfully updated.");
		
		return "profile";
	}
	
	@PostMapping("/update-password")
	public String updatePassword(Model model, HttpServletRequest request, 
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		Integer userId = Integer.parseInt(request.getParameter("id"));
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(oldpassword, loggedinUser.getPassword()) == true) {
			//System.out.println("old password typed-in matched with password on system!");
			userService.updatePassword(newpassword, userId);
			
			model.addAttribute("username", loggedinUser.getUsername());
			User user = userService.getUserById(userId);
			model.addAttribute("user_id", user.getId());
			model.addAttribute("user", user);
			model.addAttribute("email", user.getEmail());
			model.addAttribute("error_string_success", "Password is successfully updated.");
			return "profile";
			
		} else {
			//System.out.println("password not match!!! no update");
			model.addAttribute("error_string_warning", "Old password entered not match! Please try again.");
			model.addAttribute("username", loggedinUser.getUsername());
			User user = userService.getUserById(userId);
			model.addAttribute("user_id", user.getId());
			model.addAttribute("user", user);
			model.addAttribute("email", user.getEmail());
			return "profile";
		}
	}
	
	@PostMapping("/update-email")
	public String updateEmail(Model model, HttpServletRequest request, @AuthenticationPrincipal CustomUserDetails loggedinUser)
		throws MessagingException, UnsupportedEncodingException {
		Integer userId = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");
		
		if(userService.getUserByEmail(email) == null) {
			User user = userService.getUserById(userId);
			userService.updateEmail(user, email, getSiteURL(request));
			
			model.addAttribute("error_string_success", "Email is successfully updated. Check and verify your email before you signin again.");
			loggedinUser.setEmail(email);
			model.addAttribute("username", loggedinUser.getUsername());
			model.addAttribute("user_id", user.getId());
			model.addAttribute("user", user);
			model.addAttribute("email", user.getEmail());
			return "profile";
			
		} else {
			if(email.equals(loggedinUser.getEmail())) {
				model.addAttribute("error_string_success", "Awesome! You're going to use the same email!");
			} else {
				model.addAttribute("error_string_warning", "Email already existed. Type new valid email.");
			}
			
			model.addAttribute("username", loggedinUser.getUsername());
			User user = userService.getUserById(userId);
			model.addAttribute("user_id", user.getId());
			model.addAttribute("user", user);
			model.addAttribute("email", user.getEmail());
			return "profile";
		}
	}
	
	@PostMapping("/update-information")
	public String updateInformation(Model model, HttpServletRequest request, 
			@ModelAttribute("user") User tmp, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		Integer userId = Integer.parseInt(request.getParameter("id"));
		
		userService.updateInformation(userId, tmp);
		
		model.addAttribute("username", loggedinUser.getUsername());
		User user = userService.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("user_id", user.getId());
		model.addAttribute("email", user.getEmail());
		model.addAttribute("error_string_success", "User's profile information are successfully updated.");
		return "profile";
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
	
	// search public profile by keyword
	@PostMapping("/dashboard")
	public String search(Model model, HttpServletRequest request, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		model.addAttribute("username", loggedinUser.getUsername());
		
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User person = userService.getUserByUsername(user.getUsername());
		model.addAttribute("person", person.getId());
		
		String keyword = request.getParameter("keyword");
		List<User> users = userService.search(keyword);
		Integer count = users.size();
		
		model.addAttribute("count", count);
		model.addAttribute("users", users);
		return "dashboard";
	}
}
