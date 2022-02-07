package com.juhyang.hyamstagram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// 1. 로그인
	@GetMapping("/signin_view")
	public String SignInView() {
		return "/user/signIn";
	}
	
	// 2. 회원 가입
	
	@GetMapping("/signup_view")
	public String SignUpView() {
		return "/user/signUp";
	}
	
	//글쓰기
	
	@GetMapping("/addPost_view")
	public String addPostView() {
		return "post/add_post";
	}
	
}
