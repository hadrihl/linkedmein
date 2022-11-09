package com.example.linkedmein.service;

import java.time.LocalDateTime;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.jca.support.LocalConnectionFactoryBean;
import org.springframework.stereotype.Service;

import com.example.linkedmein.entity.Post;
import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.PostRepository;

@Service
@Transactional
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	public List<Post> getAllJobs() {
		return postRepository.findAll();
	}
	
	public List<Post> getAllOpeningJobs() {
		return postRepository.findAllOpeningJobs();
	}
	
	public void createPost(Post post, User user) {
		post.setCreatedOn(LocalDateTime.now());
		post.setUpdatedOn(LocalDateTime.now());
		post.setUser(user);
		post.setStatus(true);
		
		postRepository.save(post);
	}
	
	public List<Post> findAllPostByUserId(Integer user_id) {
		return postRepository.findAllPostsByUserId(user_id);
	}
	
	public void deletePost(Integer post_id) {
		postRepository.deleteById(post_id);
	}
	
	public Post getPostById(Integer post_id) {
		return postRepository.findById(post_id).get();
	}
	
	public void updatePost(Integer post_id, Post tmp) {
		Post post = postRepository.findById(post_id).get();
		
		post.setPosition(tmp.getPosition());
		post.setSalary(tmp.getSalary());
		post.setContent(tmp.getContent());
		post.setCompany(tmp.getCompany());
		post.setCity(tmp.getCity());
		post.setCountry(tmp.getCountry());
		post.setStatus(tmp.getStatus());
		
		post.setUpdatedOn(LocalDateTime.now());
		postRepository.save(post);
	}

}
