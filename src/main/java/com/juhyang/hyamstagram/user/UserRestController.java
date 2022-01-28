package com.juhyang.hyamstagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.hyamstagram.user.bo.UserBO;
import com.juhyang.hyamstagram.user.model.User;

@RestController

@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	UserBO userBO;
	
	// 로그인
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		User user = userBO.getUser(loginId, password);
		Map<String, String> result = new HashMap<>();
		if(user!=null) {
			//로그인 성공
			
			result.put("result", "success");
			HttpSession session = request.getSession();
			
			//id, loginId, name
			session.setAttribute("userId", user.getUser_id());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getUser_name());
			
		}
		else {
			result.put("result", "fail");
		}
		
		
		
		return result;
		
	}
	
	// 가입
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String user_name
			) {
		Map<String,String> result = new HashMap<>();
		int count =userBO.addUser(loginId, password, user_name);
		if(count==1) {
			result.put("result","success");
		}
		else {
			result.put("result","fail");
		}
		
		return result;
	}
	
	
	
	// id 중복 체크
	
	@PostMapping("/idCheck")
	public Map<String,Boolean> idCheck(
			@RequestParam("loginId") String loginId
			){
				
				Map<String,Boolean>result = new HashMap<>();
				result.put("is_duplication", userBO.checkUser(loginId));
				return result;
		
	}
	
	
	
	
	
}
