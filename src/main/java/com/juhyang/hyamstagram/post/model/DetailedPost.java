package com.juhyang.hyamstagram.post.model;

import java.util.List;

import com.juhyang.hyamstagram.post.comment.model.Comment;

public class DetailedPost {
	// 포스트, 댓글 리스트, 좋아요 개수 
	private Post post;
	private List<Comment> commentList;
	private boolean isLike;
	private int countLike;
	private String userProfile;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	

	
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	
	
	
	
	
}
