package com.juhyang.hyamstagram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@GetMapping("/Profile_view")
	public String addProfileView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userLoginId = (String)session.getAttribute("userLoginId");
		String userName = (String)session.getAttribute("userName");
		String imagePath = (String)session.getAttribute("imagePath");
		return "/user/profile";
	}
	
	
	
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 세션에 회원 정보 제거 
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/signin_view";
	}
	
	@GetMapping("/add_info_view")
	public String addInfoView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userLoginId = (String)session.getAttribute("userLoginId");
		String userName = (String)session.getAttribute("userName");
		String imagePath = (String)session.getAttribute("imagePath");
		return "/user/addInfo";
		
	}
	


}
