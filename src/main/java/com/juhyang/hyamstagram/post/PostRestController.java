package com.juhyang.hyamstagram.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.juhyang.hyamstagram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	PostBO postBO;
	
	
	// 글쓰기 api
	
	@PostMapping("/create")
	public Map<String, String> createPost(
			@RequestParam("content") String content,
			@RequestParam(value = "file", required = true) List<MultipartFile> files,
			
			MultipartHttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		
		// 현재 로그인된 사용자의 user table id(pk)
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		int count = postBO.addPost(
				userId, content, files,userName);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
