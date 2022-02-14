package com.juhyang.hyamstagram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.hyamstagram.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	public int insertComment(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content
			);

	
	public List<Comment> selectCommentListByPostId(
			@Param("postId") int postId);
	
	
}
