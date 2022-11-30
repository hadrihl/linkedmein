package com.example.linkedmein;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.annotation.Rollback;

import com.example.linkedmein.entity.Role;
import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.RoleRepository;
import com.example.linkedmein.repository.UserRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class UserRepositoryTest {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
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
	
	@Test
	public void test_get_user_by_email() {
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");

		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		User savedUser = userRepository.save(user);
		User existedUser = userRepository.findUserByEmail("foo@example.com");
		
		assertThat(existedUser.getEmail()).isEqualTo(savedUser.getEmail());
	}
	
	@Test
	public void test_get_user_by_username() {
		User user = new User();
		user.setUsername("foo");
		user.setEmail("foo@example.com");

		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		user.setPassword(pe.encode("password"));
		
		User savedUser = userRepository.save(user);
		User existedUser = userRepository.findUserByUsername("foo");
		
		assertThat(existedUser.getUsername()).isEqualTo(savedUser.getUsername());
	}
	
	@Test
	public void test_create_user_roles() {
		Role role_admin = new Role("ADMIN");
		Role role_user = new Role("USER");
		
		roleRepository.saveAll(List.of(role_user, role_admin));
	}
	
	@Test
	public void test_add_roles_to_user() {
		User user_admin = userRepository.findUserByEmail("hadrihilmi@gmail.com");
		
		if(user_admin != null) {
			Role USER = roleRepository.getReferenceById(9);
			Role ADMIN = roleRepository.getReferenceById(10);
			
			user_admin.addRoles(ADMIN);
			user_admin.addRoles(USER);
			userRepository.save(user_admin);
		}
		
		Set<Role> roles = user_admin.getRoles();
		
		assertThat(roles.size()).isEqualTo(roleRepository.findAll().size());
	}
}