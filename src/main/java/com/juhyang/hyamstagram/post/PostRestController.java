package com.juhyang.hyamstagram.post;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/post")
public class PostRestController {

	@GetMapping("/main_view")
	public String mainView() {
		return "/post/main_view";
	}
}
