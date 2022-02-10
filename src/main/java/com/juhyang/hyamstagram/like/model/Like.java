package com.juhyang.hyamstagram.like.model;

public class Like {

	int like_id;
	int like_userId; 
	String like_username;
	int like_postId;
	
	
	
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getLike_userId() {
		return like_userId;
	}
	public void setLike_userId(int like_userId) {
		this.like_userId = like_userId;
	}
	public String getLike_username() {
		return like_username;
	}
	public void setLike_username(String like_username) {
		this.like_username = like_username;
	}
	public int getLike_postId() {
		return like_postId;
	}
	public void setLike_postId(int like_postId) {
		this.like_postId = like_postId;
	}
	
	
	
}
