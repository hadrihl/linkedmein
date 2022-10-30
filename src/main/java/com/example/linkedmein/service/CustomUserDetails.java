package com.example.linkedmein.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.linkedmein.entity.User;

public class CustomUserDetails implements UserDetails {
	
	private User user;
	
	public CustomUserDetails(User user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return user.isEnabled();
	}
	
	public void setUsername(String username) {
		this.user.setUsername(username);
	}
	
	public void setPassword(String password) {
		BCryptPasswordEncoder passswordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passswordEncoder.encode(password);
		this.user.setPassword(encodedPassword);
	}
	
	public String getEmail() {
		return user.getEmail();
	}
	
	public void setEmail(String email) {
		this.user.setEmail(email);
	}

}
