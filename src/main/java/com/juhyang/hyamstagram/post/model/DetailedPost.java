package com.juhyang.hyamstagram.post.model;

import java.util.Date;

public class DetailedPost {
	
	private Post post;
	private boolean same;
	private int countLike;
	
	public boolean isSame() {
		return same;
	}
	public void setSame(boolean same) {
		this.same = same;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public int getCountLike() {
		return countLike;
	}
	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}
	
	
	
	
	
}
