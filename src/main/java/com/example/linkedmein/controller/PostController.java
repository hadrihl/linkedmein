package com.example.linkedmein.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.linkedmein.entity.Post;
import com.example.linkedmein.entity.User;
import com.example.linkedmein.service.CustomUserDetails;
import com.example.linkedmein.service.PostService;
import com.example.linkedmein.service.UserService;

@Controller
public class PostController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;

	@GetMapping("/jobs")
	public String getJobsAdvertisementPage(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
		List<Post> jobs = postService.getAllOpeningJobs();

		if(jobs == null) {
			model.addAttribute("error_string_warning", "No jobs opportunities found.");
			return "jobs";
			
		} else {
			model.addAttribute("error_string_success", "Got jobs opening!");
			model.addAttribute("count", jobs.size());
			model.addAttribute("jobs", jobs);
			return "jobs";
		}
	}
	
	@GetMapping("/new-post")
	public String getPost(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
//		LocalDateTime timestamp = LocalDateTime.now();
//		System.out.println("raw timestamp = " + timestamp);
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		System.out.println("readable timestamp = " + timestamp.format(formatter));
		return "new-post";
	}
	
	@PostMapping("/new-post")
	public String createNewPost(Model model, @ModelAttribute("post") Post post,
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		
		if(post.getPosition() != null && post.getSalary() != null &&
				post.getContent() != null && post.getCompany() != null && 
				post.getCity() != null && post.getCountry() != null) {
			
			User user = userService.getUserByUsername(loggedinUser.getUsername());
			postService.createPost(post, user);
			return "redirect:jobs";
			
		} else {
			model.addAttribute("error_string_warning", "Cannot post job. Check your post and try again.");
			return "new-post";
		}
		
		
	}
	
	@GetMapping("/manage-post")
	public String managePost(Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
		List<Post> jobs = postService.findAllPostByUserId(user.getId());
		
		if(jobs == null) {
			model.addAttribute("error_string_warning", "No posts found.");
			return "manage-post";
		} else {
			model.addAttribute("error_string_success", "(" + jobs.size() + ") posts found.");
			model.addAttribute("jobs", jobs);
			return "manage-post";
		}
	}
	
	@PostMapping("/delete-post")
	public String deletePost(Model model, HttpServletRequest request) {
		String post_id = request.getParameter("id");
		System.out.println("post_id = " + post_id); // debugging purposes
		
		if(post_id == null) {
			model.addAttribute("error_string_warning", "Cannot delete post. Please try again");
			return "manage-post";
		} else {
			model.addAttribute("error_string_success", "Post deleted successfully.");
			postService.deletePost(Integer.parseInt(post_id));
			return "redirect:manage-post";
		}
	}
	
	
	@GetMapping("/edit-post")
	public String editPost(Model model, HttpServletRequest request,
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		User user = userService.getUserByUsername(loggedinUser.getUsername());
		model.addAttribute("username", loggedinUser.getUsername());
		model.addAttribute("user_id", user.getId());
		
		String post_id = request.getParameter("id");
		Post post = postService.getPostById(Integer.parseInt(post_id));
		
		model.addAttribute("job", post);
		return "edit-post";
	}
	
	@PostMapping("/update-post")
	public String updatePost(Model model, HttpServletRequest request,
			@ModelAttribute("job") Post post) {
		String post_id = request.getParameter("id");
		String status = request.getParameter("status");
		
		postService.updatePost(Integer.parseInt(post_id), post);
		return "redirect:manage-post";
	}
}
