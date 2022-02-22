package com.juhyang.hyamstagram.post.model;

import java.util.Date;

public class Hashtag {
	 private int hashtag_id; 
	 private int post_userId;
	 private int post_id ;
	 private String content;
	 private Date createdAt;
	 
	 
	public int getHashtag_id() {
		return hashtag_id;
	}
	public void setHashtag_id(int hashtag_id) {
		this.hashtag_id = hashtag_id;
	}
	public int getPost_userId() {
		return post_userId;
	}
	public void setPost_userId(int post_userId) {
		this.post_userId = post_userId;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	 
	 
	 
	 
}
