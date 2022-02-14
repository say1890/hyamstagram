package com.juhyang.hyamstagram.post.comment.model;

import java.util.Date;

public class Comment {
		int comment_id;
		int comment_userId;
		String comment_userName	;
		int comment_post_id;
		String comment;
		Date createdAt;
		
		
		
		public int getComment_id() {
			return comment_id;
		}
		public void setComment_id(int comment_id) {
			this.comment_id = comment_id;
		}
		public int getComment_userId() {
			return comment_userId;
		}
		public void setComment_userId(int comment_userId) {
			this.comment_userId = comment_userId;
		}
		public String getComment_userName() {
			return comment_userName;
		}
		public void setComment_userName(String comment_userName) {
			this.comment_userName = comment_userName;
		}
		public int getComment_post_id() {
			return comment_post_id;
		}
		public void setComment_post_id(int comment_post_id) {
			this.comment_post_id = comment_post_id;
		}
		public String getComment() {
			return comment;
		}
		public void setComment(String comment) {
			this.comment = comment;
		}
		public Date getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}
		

}
