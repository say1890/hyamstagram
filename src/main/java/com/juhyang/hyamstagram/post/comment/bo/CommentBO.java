package com.juhyang.hyamstagram.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.hyamstagram.post.comment.dao.CommentDAO;

@Service	
public class CommentBO {
	@Autowired
	CommentDAO commentDAO;
	public int addComment(int postId, int userId, String userName, String content) {
		return commentDAO.insertComment(postId, userId, userName, content);
		
		
	}
}
