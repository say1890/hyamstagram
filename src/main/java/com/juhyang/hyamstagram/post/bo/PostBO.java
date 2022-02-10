package com.juhyang.hyamstagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.hyamstagram.common.FileManagerService;
import com.juhyang.hyamstagram.post.dao.PostDAO;
import com.juhyang.hyamstagram.post.model.Post;

@Service
public class PostBO {
	@Autowired
	PostDAO postDAO;
	public int addPost(int userId, String content, MultipartFile file, String userName) {
		// 파일을 컴퓨터 (서버)에 저장하고, 클라이언트가(브라우저) 가 접근 가능한 주소를 만들어 낸다.  
	String filePath = FileManagerService.saveFile(userId, file);
	return postDAO.insertPost(userId, content, filePath,userName);
	}
	
	public Post getPost(int postId) {
		return postDAO.selectPost(postId);
	}

	public List<Post> getPostList(int userId) {
		return postDAO.selectPostList(userId);
	}
	

}
