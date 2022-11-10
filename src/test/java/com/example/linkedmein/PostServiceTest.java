package com.example.linkedmein;

import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.annotation.Rollback;

import com.example.linkedmein.entity.Post;
import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.PostRepository;
import com.example.linkedmein.repository.UserRepository;
import com.example.linkedmein.service.PostService;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(true)
public class PostServiceTest {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	private PostService postService;
	
	@Autowired
	private TestEntityManager em;
	
	@BeforeEach void setup() {
		this.postService = new PostService(postRepository);
	}

	@Test
	public void test_get_all_posts() {
		List<Post> results = postService.getAllJobs();
		
		assertThat(results.size()).isEqualTo(postRepository.findAll().size());
	}
	
	@Test
	public void test_get_all_posts_that_are_available() {
		List<Post> results = postService.getAllOpeningJobs();
		
		assertThat(results.size()).isEqualTo(postRepository.findAllOpeningJobs().size());
	}
	
	@Test
	public void test_post_creation() {
		Post post = new Post();
		post.setPosition("sofware engineer");
		post.setCompany("My Company Sdn Bhd");
		post.setCity("Penang");
		post.setCountry("Malaysia");
		post.setSalary("9000");
		post.setContent("This is a simple content.");
		post.setCreatedOn(LocalDateTime.now());
		post.setUpdatedOn(LocalDateTime.now());
		
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");

		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		userRepository.save(user);
		
		post.setUser(user);
		post.setStatus(true);
		
		Post savedPost = postService.savePost(post, user);
		Post existedPost = em.find(Post.class, savedPost.getId());
		
		assertThat(existedPost.getId()).isEqualTo(savedPost.getId());
	}
}
