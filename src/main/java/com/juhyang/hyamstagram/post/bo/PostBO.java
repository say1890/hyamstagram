package com.juhyang.hyamstagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.hyamstagram.common.FileManagerService;
import com.juhyang.hyamstagram.like.bo.LikeBO;
import com.juhyang.hyamstagram.post.comment.bo.CommentBO;
import com.juhyang.hyamstagram.post.comment.model.Comment;
import com.juhyang.hyamstagram.post.dao.PostDAO;
import com.juhyang.hyamstagram.post.model.DetailedPost;
import com.juhyang.hyamstagram.post.model.Post;
import com.juhyang.hyamstagram.user.bo.UserBO;

@Service
public class PostBO {
	@Autowired
	PostDAO postDAO;
	@Autowired
	LikeBO likeBO;
	@Autowired
	CommentBO commentBO;
	
	@Autowired
	UserBO userBO;
	
	
	public int addPost(int userId, String content, MultipartFile file, String userName, boolean commentSetting) {
		// 파일을 컴퓨터 (서버)에 저장하고, 클라이언트가(브라우저) 가 접근 가능한 주소를 만들어 낸다.  
	String filePath = FileManagerService.saveFile(userId, file);
	return postDAO.insertPost(userId, content, filePath,userName,commentSetting);
	}
	
	public Post getPost(int postId) {
		return postDAO.selectPost(postId);
	}

	public int removePost(int postId, int userId) {
		
		//파일 삭제
		Post post = postDAO.selectPost(postId);
		//좋아요 삭제
		likeBO.deleteLikeByPostId(postId);
		 	// -> 좋아요 몇개가 삭제됐는지 리턴 
		
		if(post.getPost_userId() != userId) {
			return 0;
		}
		
		//댓글 삭제
		commentBO.deleteCommentWithPost(postId);
		

		
		FileManagerService.removeFile(post.getPost_imagePath());
		
		
		//포스트 삭제
		return postDAO.deletePost(postId);
		
		
	}
	
	
	public List<DetailedPost> getPostList(int userId) {
		List<Post> postList = postDAO.selectPostList();
		
		List<DetailedPost> DetailedPostList = new ArrayList<>();
		
		// 포스트 하나당 댓글 가져오기
		for(Post post : postList) {
						// 해당하는 포스트의 댓글 가져오기 
						List<Comment> commentList = commentBO.getCommentListByPostId(post.getPost_id());
						
						// 해당하는 포스트를 현재 로그인한 사용자가 좋아요 했는지 확인
						boolean isLike = likeBO.likeByUserId(post.getPost_id(), userId);
						
						//사용자의 프로필 사진 주소 받아오기.
						String userProfile  = userBO.getImagePath(post.getPost_userId());
						
						//  좋아요 개수
						int likeCount = likeBO.selectLike(post.getPost_id());
						
						//post, 댓글 매칭
						DetailedPost DetailedPost = new DetailedPost();
						DetailedPost.setPost(post);
						DetailedPost.setCommentList(commentList); 
						DetailedPost.setLike(isLike);
						DetailedPost.setCountLike(likeCount);
						DetailedPost.setUserProfile(userProfile);
						DetailedPostList.add(DetailedPost);
		}
		return DetailedPostList;
		
		
	}

	public List<DetailedPost> detailedList(List<Post> postlist) {
	
		return postDAO.selectDetailedList(postlist);
	}

	public int getPostid(int userId) {
		return postDAO.selectPostId(userId);
		
	}

	public void addHashTag(int userId, int postId, String content) {
		if(content.contains("#")) {
			 String target = "#";
			 ArrayList<String> hashtags = new ArrayList<>();   
			 int target_num = content.indexOf(target); 
			    while(target_num != -1){
			        String result = content.substring(target_num,(content.substring(target_num).indexOf(" ")+target_num));
			        target_num = content.indexOf(target,target_num+target.length());
			        hashtags.add(result);
			       
			    }
			   int repeat = hashtags.size()-1;
			   while(repeat != -1){
				    postDAO.insertHashTag(userId, postId, hashtags.get(repeat));
			        repeat --;
			   }
			  
			    	
			
		}
		
		//
		
				
			
		}
		
		


	
	

}
