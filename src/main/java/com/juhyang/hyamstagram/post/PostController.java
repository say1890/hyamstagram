package com.juhyang.hyamstagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.juhyang.hyamstagram.post.bo.PostBO;
import com.juhyang.hyamstagram.post.model.DetailedPost;


@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/list_view")
	public String listView(
			HttpServletRequest request
			, Model model){
		
				HttpSession session = request.getSession();
				int userId = (Integer)session.getAttribute("userId");
				String userName = (String)session.getAttribute("userName");	
				String imagePath = (String)session.getAttribute("imagePath");
				List<DetailedPost> postList = postBO.getPostList(userId);
				
				model.addAttribute("postList", postList);	
			
				return "/post/main";
	}
	
	@RequestMapping("/add_post_view")
	public String postView() {
		return"/post/add_post";
	}
	

	
	
}
