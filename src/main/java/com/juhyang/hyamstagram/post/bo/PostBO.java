package com.juhyang.hyamstagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.hyamstagram.common.FileManagerService;
import com.juhyang.hyamstagram.like.bo.LikeBO;
import com.juhyang.hyamstagram.post.dao.PostDAO;
import com.juhyang.hyamstagram.post.model.DetailedPost;
import com.juhyang.hyamstagram.post.model.Post;

@Service
public class PostBO {
	@Autowired
	PostDAO postDAO;
	LikeBO likeBO;
	public int addPost(int userId, String content, MultipartFile file, String userName) {
		// 파일을 컴퓨터 (서버)에 저장하고, 클라이언트가(브라우저) 가 접근 가능한 주소를 만들어 낸다.  
	String filePath = FileManagerService.saveFile(userId, file);
	return postDAO.insertPost(userId, content, filePath,userName);
	}
	
	public Post getPost(int postId) {
		return postDAO.selectPost(postId);
	}

	public List<DetailedPost> getPostList() {
		List<Post> postList = postDAO.selectPostList();
		
		List<DetailedPost> DetailedPostList = new ArrayList<>();
		
		for(Post post : postList) {
						
						//  좋아요 개수
						int likeCount = likeBO.selectLike(post.getPost_id());
						DetailedPost DetailedPost = new DetailedPost();
						DetailedPost.setPost(post);

						
						DetailedPost.setCountLike(likeCount);
						
						DetailedPostList.add(DetailedPost);
		}
		return DetailedPostList;
		
		
	}

	public List<DetailedPost> detailedList(List<Post> postlist) {
	
		return postDAO.selectDetailedList(postlist);
	}
	

}
