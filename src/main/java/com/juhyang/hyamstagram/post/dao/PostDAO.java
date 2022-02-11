package com.juhyang.hyamstagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.hyamstagram.post.model.DetailedPost;
import com.juhyang.hyamstagram.post.model.Post;

@Repository
public interface PostDAO {
	public int insertPost(
			@Param("userId") int userId, 
			@Param("content") String content,
			@Param("imagePath") String imagePath,
			@Param("userName")String userName
			
			);

	public Post selectPost(@Param("postId") int postId);
	
	public List<Post> selectPostList();

	public List<DetailedPost> selectDetailedList(List<Post> postlist);
}
