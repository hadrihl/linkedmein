package com.example.linkedmein.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.linkedmein.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	@Query("SELECT u FROM User u WHERE u.email = :email")
	public User findUserByEmail(String email);
	
	@Query("SELECT u FROM User u WHERE u.verificationCode = ?1")
	public User findUserByVerificationCode(String code);

}
