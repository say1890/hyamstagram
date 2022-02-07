package com.juhyang.hyamstagram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@RequestMapping("/list_view")
	public String mainView()
	{
		return "/post/main";
	}
	
	@RequestMapping("/add_post_view")
	public String postView() {
		return"/post/add_post";
	}
	
	
	
	
}
