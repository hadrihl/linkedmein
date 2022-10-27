package com.example.linkedmein.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	// save/update user object
	public void saveUser(User user) {
		userRepository.save(user);
	}

}
