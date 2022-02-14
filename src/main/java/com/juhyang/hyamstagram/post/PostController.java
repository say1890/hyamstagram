package com.juhyang.hyamstagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.juhyang.hyamstagram.like.LikeRestController;
import com.juhyang.hyamstagram.like.bo.LikeBO;
import com.juhyang.hyamstagram.like.model.Like;
import com.juhyang.hyamstagram.post.bo.PostBO;
import com.juhyang.hyamstagram.post.model.DetailedPost;
import com.juhyang.hyamstagram.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	@RequestMapping("/list_view")
	public String listView(
			HttpServletRequest request
			, Model model
			){
				// 로그인한 사용자의 글만 가져온다. 
				HttpSession session = request.getSession();
				int userId = (Integer)session.getAttribute("userId");
				String userName = (String)session.getAttribute("userName");
				
		
				List<DetailedPost> postList = postBO.getPostList(userId);
				
				model.addAttribute("postList", postList);	
			
				return "/post/main";
	}
	
	@RequestMapping("/add_post_view")
	public String postView() {
		return"/post/add_post";
	}
	

	
	
}
