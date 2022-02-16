package com.juhyang.hyamstagram.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.hyamstagram.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {

	@Autowired
	LikeBO likeBO;

	
	@GetMapping("/like")
	public Map<String, Boolean> addLike( @RequestParam("postId") int postId
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, Boolean>result = new HashMap<>();
		
		boolean isLike = likeBO.like(postId, userId);
		
		//좋아요 - > 
		result.put("isLike",isLike);
		return result;
	}
	
	
//	
//	@GetMapping("/dislike")
//	public Map<String, String> removeLike(
//			@RequestParam("postId") int postId
//			, HttpServletRequest request ) {
//		HttpSession session = request.getSession();
//		int userId = (Integer)session.getAttribute("userId");
//		 Map<String, String> result = new HashMap<>();
//		int count = likeBO.removeLike(postId, userId);
//		if(count == 0) {
//			result.put("result", "fail");
//		}
//		else {
//			result.put("result", "success");
//		}
//		return result;
//		
//		
//		
//	}
	
}
