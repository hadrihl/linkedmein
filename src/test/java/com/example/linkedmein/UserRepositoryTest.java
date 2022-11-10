package com.example.linkedmein;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.annotation.Rollback;

import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.UserRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(true)
public class UserRepositoryTest {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private TestEntityManager em;
	
	@Test
	public void test_user_creation() {
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");

		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		User savedUser = userRepository.save(user);
		User existUser = em.find(User.class, savedUser.getId());
		
		assertThat(existUser.getId()).isEqualTo(savedUser.getId());
	}
}