package com.example.linkedmein;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.annotation.Rollback;

import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.UserRepository;
import com.example.linkedmein.service.UserService;

import net.bytebuddy.utility.RandomString;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(true)
public class UserServiceTest {
	
	@Autowired
	private UserRepository userRepo;

	private UserService userService;
	
	@Autowired
	private TestEntityManager em;

	
	@BeforeEach void setup() {
		this.userService = new UserService(this.userRepo);
	}
	
	@Test
	public void test_count_registered_user() {
		final Long count = userService.countRegisteredUser();
		assertThat(count).isEqualTo(userRepo.count());
	}
	
	@Test
	public void test_save_user_object() {
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");
		
		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		userService.saveUser(user);
		User savedUser = userService.getUserByUsername("foo");
		User existedUser = em.find(User.class, savedUser.getId());
		
		assertThat(savedUser.getId()).isEqualTo(existedUser.getId());

	}
	
	@Test
	public void test_search_with_keyword() {
		final String keyword = "Penang";
		final List<User> results = userService.search(keyword);
		
		assertThat(results.size()).isEqualTo(userRepo.search(keyword).size());
	}
	
	@Test
	public void test_update_user_profile() {
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");
		
		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		userService.saveUser(user); // user object init
		
		user.setFirstname("Foo");
		user.setLastname("Bar");
		user.setBio("This is my short bio.");
		user.setCompany("My Company Sdn Bhd");
		user.setCity("Penang");
		user.setCountry("Malaysia");
		
		userService.saveUser(user); // update user object 
		
		User savedUser = userService.getUserByUsername("foo");
		User existedUser = em.find(User.class, savedUser.getId());
		
		assertThat(existedUser.getCompany()).isEqualTo(savedUser.getCompany());
	}
	
	@Test
	public void test_get_all_users() {
		final List<User> results = userService.getAllUsers();
		assertThat(results.size()).isEqualTo(userService.getAllUsers().size());
	}
	
	@Test
	public void test_reset_password_token() {
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");
		
		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		user.setResetPasswordToken(RandomString.make(30));
		
		userService.saveUser(user);
		
		User savedUser = userService.getUserByUsername("foo");
		User existedUser = em.find(User.class, savedUser.getId());
		
		assertThat(existedUser.getResetPasswordToken()).isEqualTo(savedUser.getResetPasswordToken());
	}
	
	@Test
	public void test_confirmation_email_verification_code() {
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");
		
		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		user.setVerificationCode(RandomString.make(64));
		user.setEnabled(false);
		
		userService.saveUser(user);
		
		User savedUser = userService.getUserByUsername("foo");
		User existedUser = em.find(User.class, savedUser.getId());
		
		assertThat(existedUser.getVerificationCode()).isEqualTo(savedUser.getVerificationCode());
	}
}
