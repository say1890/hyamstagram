package com.juhyang.hyamstagram.post;

import java.util.HashMap;
import java.util.List;
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
			@RequestParam("commentSetting") boolean commentSetting,
			@RequestParam(value = "file", required = true) MultipartFile file, 
			
			MultipartHttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		
		// 현재 로그인된 사용자의 user table id(pk)
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		content=content + " ";
		int count = postBO.addPost(
				userId, content, file,userName,commentSetting);
		
		
		Map<String, String> result = new HashMap<>();
		
		
			if(content.contains("#")) {
				int postId = postBO.getPostid(userId);
				postBO.addHashTag(userId, postId,content);
			}
			
		
		
	

		
		
		
		
		if(count == 1) {
			result.put("result", "success");
			
			
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}

	
	@GetMapping("/delete")
	public Map<String,String> deletePost(
			@RequestParam("postId") int postId,
			HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		int count = postBO.removePost(postId,userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;

	}
	
}


