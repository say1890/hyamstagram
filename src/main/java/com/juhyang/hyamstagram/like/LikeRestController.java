package com.juhyang.hyamstagram.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.hyamstagram.like.bo.LikeBO;

@RestController
@RequestMapping("/like")
public class LikeRestController {

	@Autowired
	LikeBO likeBO;
	public int countlike;
	

}
