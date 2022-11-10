package com.example.linkedmein.service;

import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.linkedmein.entity.User;
import com.example.linkedmein.repository.UserRepository;

import net.bytebuddy.utility.RandomString;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public UserService(UserRepository userRepo) {
		this.userRepository = userRepo;
	}
	
	// save/update user object
	public void saveUser(User user) {
		userRepository.save(user);
	}
	
	public long countRegisteredUser() {
		return userRepository.count();
	}
	
	public List<User> search(String keyword) {
		return userRepository.search(keyword);
	}
	
	public void updateUserProfile(User tmp) {
		User user = userRepository.findById(tmp.getId()).get(); // get user by id
		
		// update necessary information
		user.setFirstname(tmp.getFirstname());
		user.setLastname(tmp.getLastname());
		user.setBio(tmp.getBio());
		user.setCompany(tmp.getCompany());
		user.setCity(tmp.getCity());
		user.setCountry(tmp.getCountry());
		user.setImg(tmp.getImg());
		
		// save into database
		userRepository.save(user);
		
	}
	
	public void updateUsername(Integer id, String username) {
		//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		//System.out.println("before principal name = " + authentication.getName());
		
		User user = userRepository.findById(id).get();
		user.setUsername(username);
		userRepository.save(user);
		
		//System.out.println("after principal name = " + authentication.getName());
	}
	
	public void updatePassword(String newPassword, Integer userId) {
		User user = userRepository.findById(userId).get();
		String encodedPassword = passwordEncoder.encode(newPassword);
		user.setPassword(encodedPassword);
		
		userRepository.save(user);
	}
	
	public void updateEmail(User user, String email, String siteURL)
			throws MessagingException, UnsupportedEncodingException {
		user.setEmail(email);
		
		String randomCode = RandomString.make(64); // generate random verification code
		user.setVerificationCode(randomCode); // set verification code to a user
		user.setEnabled(false); // set enabled as false
		
		String toAddress = user.getEmail();
		String fromAddress = "linkedmein.project@gmail.com";
		String senderName = "LinkedMeIn Team";
		String subject = "LinkedMeIn - Verify your Email";
		
		String content = "Dear [[name]],<br>" +
						"Please click the link below to verify your email: <br>" + 
						"<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>" + 
						"Thank you,<br>" + 
						"LinkedMeIn";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom(fromAddress, senderName);
		helper.setTo(toAddress);
		helper.setSubject(subject);
		
		content = content.replace("[[name]]", user.getUsername());
		String verifyURL = siteURL + "/verify?code=" + user.getVerificationCode();
		
		content = content.replace("[[URL]]", verifyURL);
		helper.setText(content, true);
		
		mailSender.send(message);
	}
	
	public void updateInformation(Integer userid, User tmp) {
		User user = userRepository.findById(userid).get();
		
		user.setFirstname(tmp.getFirstname());
		user.setLastname(tmp.getLastname());
		user.setBio(tmp.getBio());
		user.setCompany(tmp.getCompany());
		user.setCity(tmp.getCity());
		user.setCountry(tmp.getCountry());
		user.setImg(tmp.getImg());
		
		userRepository.save(user);
	}
	
	public User getUserById(Integer user_id) {
		return userRepository.findById(user_id).get();
	}
	
	public User getUserByUsername(String username) {
		return userRepository.findUserByUsername(username);
	}
	
	public User getUserByEmail(String email) {
		return userRepository.findUserByEmail(email);
	}
	
	// return all users
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}
	
	public void register(User user, String siteURL) 
		throws MessagingException, UnsupportedEncodingException {
		
		String randomCode = RandomString.make(64); // generate random verification code
		//user.setVerificationCode(randomCode); // set verification code to a user
		//user.setEnabled(false); // set enabled as false
		
		String encodedPassword = passwordEncoder.encode(user.getPassword()); // hash the password
		user.setPassword(encodedPassword); // encoded hash password
		
		userRepository.save(user); // temporarily create a new user
		//sendVerificationEmail(user, siteURL); // let user verify
	}
	
	private void sendVerificationEmail(User user, String siteURL)
		throws MessagingException, UnsupportedEncodingException {
	
		String toAddress = user.getEmail();
		String fromAddress = "linkedmein.project@gmail.com";
		String senderName = "LinkedMeIn Team";
		String subject = "LinkedMeIn - Verify your Registration";
		
		String content = "Dear [[name]],<br>" +
						"Please click the link below to verify your registration: <br>" + 
						"<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>" + 
						"Thank you,<br>" + 
						"LinkedMeIn";
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom(fromAddress, senderName);
		helper.setTo(toAddress);
		helper.setSubject(subject);
		
		content = content.replace("[[name]]", user.getUsername());
		String verifyURL = siteURL + "/verify?code=" + user.getVerificationCode();
		
		content = content.replace("[[URL]]", verifyURL);
		helper.setText(content, true);
		
		mailSender.send(message);
	}
	
	public boolean verify(String verificationCode) {
		User user = userRepository.findUserByVerificationCode(verificationCode);
		
		if(user == null || user.isEnabled()) {
			return false;
		} else {
			user.setVerificationCode(null);
			user.setEnabled(true);
			userRepository.save(user);
			
			return true;
		}
	}
	
	public User getUserByResetPasswordToken(String token) {
		return userRepository.findUserByResetPasswordToken(token);
	}
	
	public void updateResetPasswordToken(String token, String email) 
		throws UsernameNotFoundException {
		
		User user = userRepository.findUserByEmail(email);
		
		if(user == null) {
			throw new UsernameNotFoundException("user (" + email + ") not found.");
		} else {
		
			user.setResetPasswordToken(token);
			userRepository.save(user);
		}
	}
	
	public void updatePassword(User user, String newPassword) {
		String encodedPassword = passwordEncoder.encode(newPassword);
		user.setPassword(encodedPassword);
		
		user.setResetPasswordToken(null);
		userRepository.save(user);
	}
	
	public void sendResetPasswordLink(String email, String token, String siteURL) 
		throws MessagingException, UnsupportedEncodingException {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("linkedmein.project@gmail.com", "LinkedMeIn Team");
		helper.setTo(email);
		
		String resetLink = siteURL + "/reset_password?token=" + token;
		String subject = "LinkedMeIn - link to reset your password";
		
		String content = "<p>Dear User,</p>"
	            + "<p>You have requested to reset your password.</p>"
	            + "<p>Click the link below to change your password:</p>"
	            + "<p><a href=\"" + resetLink + "\">Change my password</a></p>"
	            + "<br>"
	            + "<p>Ignore this email if you do remember your password, "
	            + "or you have not made the request.</p>";
		
		helper.setSubject(subject);
		helper.setText(content, true);
		mailSender.send(message);
	}

}
