package com.example.linkedmein;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.verify;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.UserRepository;
import com.example.linkedmein.service.UserService;

@ExtendWith(MockitoExtension.class)
public class UserServiceTest {
	
	@Mock
	private UserRepository repo;
	
	private UserService service;
	
	@Autowired
	private TestEntityManager entityManager;

	@BeforeEach
	public void setup() {
	
	}
	
	@DisplayName("JUnit test for saveUser method")
	@Test
	public void when_we_save_user_it_should_return_user() {
		
		
		User existUser = service.getUserByUsername("ramesh");
	}

}
