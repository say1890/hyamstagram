package com.juhyang.hyamstagram.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.hyamstagram.post.comment.dao.CommentDAO;
import com.juhyang.hyamstagram.post.comment.model.Comment;

@Service	
public class CommentBO {
	@Autowired
	CommentDAO commentDAO;
	public int addComment(int postId, int userId, String userName, String content) {
		return commentDAO.insertComment(postId, userId, userName, content);
	}
	public List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	public int removeComment(int CommentId) {
		return commentDAO.deleteComment(CommentId);
	}
	public int deleteCommentWithPost(int postId) {
		return commentDAO.deleteCommentWithPost(postId);
		
	}
}
