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
			@Param("userName")String userName, 
			@Param("commentSetting") boolean commentSetting
			
			);

	public Post selectPost(@Param("postId") int postId);
	
	public List<Post> selectPostList();

	public List<DetailedPost> selectDetailedList(List<Post> postlist);

	public int deletePost(int postId);

	public int selectPostId(int userId);

	public int insertHashTag(
			@Param("userId") int userId, 
			@Param("postId") int postId, 
			@Param("hashtag") String hashtag);

	

	public int getTagPostId(@Param("searchedWord") String searchedWord);
	
	public int selectSearchedPost(@Param("postId") int postId);
	
	
	
}
