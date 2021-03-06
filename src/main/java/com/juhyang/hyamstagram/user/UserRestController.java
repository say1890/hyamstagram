package com.juhyang.hyamstagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
			session.setAttribute("imagePath", user.getImagePath());
			
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
	
	//	회원 정보 수정
	@PostMapping("/editInformation")
	public Map<String, String> editInformation(
			@RequestParam(value = "userName", required =false) String userName,
			@RequestParam(value = "loginId", required =false) String loginId,
			@RequestParam(value = "introduce", required =false) String introduce,
			@RequestParam(value = "file", required = false) MultipartFile file,
			MultipartHttpServletRequest request
			)
	{
		
		HttpSession session = request.getSession();
		User user = userBO.getAfterEditUser(loginId);
		
		session.setAttribute("userId", user.getUser_id());
		session.setAttribute("userLoginId", user.getLoginId());
		session.setAttribute("userName", user.getUser_name());
		session.setAttribute("imagePath", user.getImagePath());
		
		int userId = (Integer)session.getAttribute("userId");
		int count = userBO.editUser(userId,userName,loginId,introduce,file);
		Map<String, String> result = new HashMap<>();
		if(count == 0) {
			result.put("result", "fail");
		}
		else {
			result.put("result", "success");
		}
		return result;
		
		
		
		
		
	}
	
	
	
	
	
}
