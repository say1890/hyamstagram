package com.juhyang.hyamstagram.post.model;

import java.util.Date;

public class Post {
	private int post_id;
	private int post_userId;
	private String post_userName;
	private String post_content;
	private String post_imagePath;
	private boolean commentSetting;
	private Date createdAt;
	private Date updatedAt;
	
	


	public boolean isCommentSetting() {
		return commentSetting;
	}
	public void setCommentSetting(boolean commentSetting) {
		this.commentSetting = commentSetting;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getPost_userId() {
		return post_userId;
	}
	public void setPost_userId(int post_userId) {
		this.post_userId = post_userId;
	}
	public String getPost_userName() {
		return post_userName;
	}
	public void setPost_userName(String post_userName) {
		this.post_userName = post_userName;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_imagePath() {
		return post_imagePath;
	}
	public void setPost_imagePath(String post_imagePath) {
		this.post_imagePath = post_imagePath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
	
	
	
}
