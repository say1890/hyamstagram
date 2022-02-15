package com.juhyang.hyamstagram.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.hyamstagram.like.bo.LikeBO;
import com.juhyang.hyamstagram.post.model.DetailedPost;

@RestController
@RequestMapping("/post")
public class LikeRestController {

	@Autowired
	LikeBO likeBO;

	
	@GetMapping("/like")
	public int addLike(
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		int result = likeBO.addLike(postId, userId);
		boolean isLike = likeBO.likeByUserId(postId, userId);
		return result;
	}
	/*
	public int removeLike(@RequestParam("postId") int postId) {
		
	}
	*/
}
